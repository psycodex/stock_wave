import importlib
import importlib.util
import sys
import json
import os
import requests
import logging
import importlib.util
from nse import NSE
from pathlib import Path
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Tuple, Union, Type
from types import ModuleType

import numpy as np
from loguru import logger

import pandas as pd

from config import META_FILE, ISIN_FILE, DAILY_FOLDER, headerText, DATA_DIR, splitRegex, bonusRegex
from core.config import Config
from utils.date import Dates, tz_IN

if not os.path.exists(META_FILE):
    with open(META_FILE, 'w') as file:
        file.write('{"lastUpdate": "2000-01-01T00:00:00+05:30","year": 2024}')
        pass

meta: Dict = json.loads(META_FILE.read_bytes())
if not os.path.exists(ISIN_FILE):
    with open(ISIN_FILE, 'w') as file:
        file.write("ISIN,SYMBOL\n")
        pass

isin = pd.read_csv(ISIN_FILE, index_col="ISIN")
dates = Dates(meta["lastUpdate"])


def load_module(module_str: str) -> Union[ModuleType, Type]:
    """
    Load a module specified by the given string.

    Arguments
    module_str (str): Module filepath, optionally adding the class name
        with format <filePath>:<className>

    Raises:
    ModuleNotFoundError: If module is not found
    AttributeError: If class name is not found in module.

    Returns: ModuleType
    """

    class_name = None
    module_path = module_str

    if "|" in module_str:
        module_path, class_name = module_str.split("|")

    module_path = Path(module_path).expanduser().resolve()

    spec = importlib.util.spec_from_file_location(module_path.stem, module_path)

    if not spec or not spec.loader:
        raise ModuleNotFoundError(f"Could not load module {module_path.stem}")

    module = importlib.util.module_from_spec(spec)

    sys.modules[module_path.stem] = module

    spec.loader.exec_module(module)

    return getattr(module, class_name) if class_name else module


def log_unhandled_exception(exc_type, exc_value, exc_traceback):
    # Log the unhandled exception
    logger.critical(
        "Unhandled exception", exc_info=(exc_type, exc_value, exc_traceback)
    )


def getMuhuratHolidayInfo(holidays: Dict[str, List[dict]]) -> dict:
    for lst in holidays.values():
        for dct in lst:
            if "Laxmi Pujan" in dct["description"]:
                return dct

    return {}


def downloadSpecialSessions() -> Tuple[datetime, ...]:
    base_url = "https://raw.githubusercontent.com/BennyThadikaran/eod2_data"

    err_text = "special_sessions.txt download failed. Please try again later."

    try:
        res = requests.get(f"{base_url}/main/special_sessions.txt")
    except Exception as e:
        logger.exception(err_text, exc_info=e)
        exit()

    if not res.ok:
        logger.exception(f"{err_text} {res.status_code}: {res.reason}")
        exit()

    return tuple(
        datetime.fromisoformat(x).astimezone(tz_IN)
        for x in res.text.strip().split("\n")
    )


def getHolidayList(nse: NSE):
    """Makes a request for NSE holiday list for the year.
    Saves and returns the holiday Object"""
    try:
        data = nse.holidays(type=nse.HOLIDAY_TRADING)
    except Exception as e:
        logger.warning(f"Failed to download holidays - {e}")
        exit()

    # CM pertains to capital market or equity holidays
    data["CM"].append(getMuhuratHolidayInfo(data))

    data = {k["tradingDate"]: k["description"] for k in data["CM"]}
    logger.info("NSE Holiday list updated")

    return data


def checkForHolidays(nse: NSE, special_sessions: Tuple[datetime, ...]):
    """Returns True if current date is a holiday.
    Exits the script if today is a holiday"""

    global hasLatestHolidays

    # the current date for which data is being synced
    curDt = dates.dt.strftime("%d-%b-%Y")
    isToday = curDt == dates.today.strftime("%d-%b-%Y")

    if dates.dt in special_sessions:
        return False

    # no holiday list or year has changed or today is a holiday
    if (
            "holidays" not in meta
            or meta["year"] != dates.dt.year
            or (curDt in meta["holidays"] and not hasLatestHolidays)
    ):
        if dates.dt.year == dates.today.year:
            meta["holidays"] = getHolidayList(nse)
            meta["year"] = dates.dt.year
            hasLatestHolidays = True

    isMuhurat = (
            curDt in meta["holidays"] and "Laxmi Pujan" in meta["holidays"][curDt]
    )

    if isMuhurat:
        return False

    if dates.dt.weekday() == 6:
        return True

    if curDt in meta["holidays"]:
        if not isToday:
            logger.info(f'{curDt} Market Holiday: {meta["holidays"][curDt]}')
            return True

        logger.info(f'Market Holiday: {meta["holidays"][curDt]}')
        exit()

    return False


def validateNseActionsFile(nse: NSE):
    """Check if the NSE Corporate actions() file exists.
    If exists, check if the file is older than 7 days.
    Else request actions for the next 8 days from current date.
    The actionsFile pertains to Bonus, Splits, dividends etc.
    """

    for action in ("equity", "sme"):
        segment = "sme" if action == "sme" else "equities"

        if f"{action}Actions" not in meta:
            logger.info(f"Downloading NSE {action.upper()} actions")

            try:
                meta[f"{action}Actions"] = nse.actions(
                    segment=segment,
                    from_date=dates.dt,
                    to_date=dates.dt + timedelta(8),
                )
            except Exception as e:
                logger.warning(f"Failed to download {action} actions - {e}")
                exit()

            meta[f"{action}ActionsExpiry"] = (
                    dates.dt + timedelta(7)
            ).isoformat()
        else:
            expiryDate = datetime.fromisoformat(
                meta[f"{action}ActionsExpiry"]
            ).astimezone(tz_IN)

            newExpiry = (expiryDate + timedelta(7)).isoformat()

            # Update every 7 days from last download
            if dates.dt < expiryDate:
                continue

            logger.info(f"Updating NSE {action.upper()} actions")

            try:
                meta[f"{action}Actions"] = nse.actions(
                    segment=segment,
                    from_date=expiryDate,
                    to_date=expiryDate + timedelta(8),
                )
            except Exception as e:
                logger.warning(f"Failed to update {action} actions - {e}")
                exit()

            meta[f"{action}ActionsExpiry"] = newExpiry


def updatePendingDeliveryData(nse: NSE, date: str):
    """Return True on successful file update or max failed attempts
    else False on failed attempt
    """

    dt = datetime.fromisoformat(date)
    daysSinceFailure = (datetime.now(tz_IN) - dt).days
    error_context = None

    dt = dt.replace(tzinfo=None)

    try:
        FILE = nse.deliveryBhavcopy(dt)
    except (RuntimeError, Exception):
        if daysSinceFailure == 5:
            logger.warning("Max attempts reached: Aborting Future attempts")
            return True

        logger.info(f"{dt:%d %b}: Delivery report not yet updated.")
        return False

    try:
        df = pd.read_csv(FILE, index_col="SYMBOL")

        # save the csv file to the below folder.
        DLV_FOLDER = DATA_DIR / "nseDelivery" / str(dt.year)

        if not DLV_FOLDER.is_dir():
            DLV_FOLDER.mkdir(parents=True)

        df.to_csv(DLV_FOLDER / FILE.name)

        # filter the pd.DataFrame for stocks series EQ, BE and BZ
        # https://www.nseindia.com/market-data/legend-of-series
        df = df[
            (df[" SERIES"] == " EQ")
            | (df[" SERIES"] == " BE")
            | (df[" SERIES"] == " BZ")
            | (df[" SERIES"] == " SM")
            | (df[" SERIES"] == " ST")
            ]

        for sym in df.index:
            error_context = f"{sym} - {dt}"
            DAILY_FILE = DAILY_FOLDER / f"{sym.lower()}.csv"

            if not DAILY_FILE.exists():
                continue

            dailyDf = pd.read_csv(
                DAILY_FILE, index_col="Date", parse_dates=["Date"]
            )

            if dt not in dailyDf.index:
                continue

            vol = dailyDf.loc[dt, "Volume"]
            series = df.loc[sym, " SERIES"]

            trdCnt, dq = df.loc[sym, [" NO_OF_TRADES", " DELIV_QTY"]]

            # BE and BZ series stocks are all delivery trades,
            # so we use the volume
            dq = vol if series in (" BE", " BZ") else int(dq)
            avgTrdCnt = round(vol / trdCnt, 2)

            dailyDf.loc[dt, "TOTAL_TRADES"] = trdCnt
            dailyDf.loc[dt, "QTY_PER_TRADE"] = avgTrdCnt
            dailyDf.loc[dt, "DLV_QTY"] = dq
            dailyDf.to_csv(DAILY_FILE)

        if hook and hasattr(hook, "updatePendingDeliveryData"):
            hook.updatePendingDeliveryData(df, dt)
    except Exception as e:
        logger.exception(
            f"Error updating delivery report dated {dt:%d %b %Y} - {error_context}",
            exc_info=e,
        )
        FILE.unlink()
        return False

    meta["DLV_PENDING_DATES"].remove(date)
    FILE.unlink()
    logger.info(f"Updating delivery report dated {dt:%d %b %Y}: ✓ Done")
    return True


def updateNseEOD(bhavFile: Path, deliveryFile: Optional[Path]):
    """Update all stocks with latest price data from bhav copy"""

    logger.info("Starting Data Sync")

    isinUpdated = False

    df = pd.read_csv(bhavFile, index_col="ISIN")

    BHAV_FOLDER = DATA_DIR / "nseBhav" / str(dates.dt.year)

    # Create it if not exists
    if not BHAV_FOLDER.is_dir():
        BHAV_FOLDER.mkdir(parents=True)

    df.to_csv(BHAV_FOLDER / bhavFile.name)

    # filter the pd.DataFrame for stocks series EQ, BE and BZ
    # https://www.nseindia.com/market-data/legend-of-series
    df = df.loc[
        (df["SctySrs"] == "EQ")
        | (df["SctySrs"] == "BE")
        | (df["SctySrs"] == "BZ")
        | (df["SctySrs"] == "SM")
        | (df["SctySrs"] == "ST")
        ]

    if deliveryFile:
        dlvDf = pd.read_csv(deliveryFile, index_col="SYMBOL")

        # save the csv file to the below folder.
        DLV_FOLDER = DATA_DIR / "nseDelivery" / str(dates.dt.year)

        if not DLV_FOLDER.is_dir():
            DLV_FOLDER.mkdir(parents=True)

        dlvDf.to_csv(DLV_FOLDER / deliveryFile.name)

        # filter the pd.DataFrame for stocks series EQ, BE and BZ
        # https://www.nseindia.com/market-data/legend-of-series
        dlvDf = dlvDf[
            (dlvDf[" SERIES"] == " EQ")
            | (dlvDf[" SERIES"] == " BE")
            | (dlvDf[" SERIES"] == " BZ")
            | (dlvDf[" SERIES"] == " SM")
            | (dlvDf[" SERIES"] == " ST")
            ]
    else:
        dlvDf = None

    # iterate over each row as a tuple
    for t in df.itertuples():
        # ignore rights issue
        if "-RE" in t.TckrSymb:
            continue

        if dlvDf is not None:
            if t.TckrSymb in dlvDf.index:
                trdCnt, dq = dlvDf.loc[
                    t.TckrSymb, [" NO_OF_TRADES", " DELIV_QTY"]
                ]

                # BE and BZ series stocks are all delivery trades,
                # so we use the volume
                dq = t.TtlTradgVol if t.SctySrs in ("BE", "BZ") else int(dq)
            else:
                trdCnt = dq = np.nan
        else:
            trdCnt = dq = ""

        prefix = "_sme" if t.SctySrs in ("SM", "ST") else ""
        SYM_FILE = DAILY_FOLDER / f"{t.TckrSymb.lower()}{prefix}.csv"

        # ISIN is a unique identifier for each stock symbol.
        # When a symbol name changes its ISIN remains the same
        # This allows for tracking changes in symbol names and
        # updating file names accordingly
        if t.Index not in isin.index:
            isinUpdated = True
            isin.at[t.Index, "SYMBOL"] = t.TckrSymb

        # if symbol name does not match the symbol name under its ISIN
        # we rename the files in daily and delivery folder
        if t.TckrSymb != isin.at[t.Index, "SYMBOL"]:
            isinUpdated = True
            old = isin.at[t.Index, "SYMBOL"].lower()

            new = t.TckrSymb.lower()

            isin.at[t.Index, "SYMBOL"] = t.TckrSymb

            SYM_FILE = DAILY_FOLDER / f"{new}.csv"
            OLD_FILE = DAILY_FOLDER / f"{old}.csv"

            try:
                OLD_FILE.rename(SYM_FILE)
            except FileNotFoundError:
                logger.warning(
                    f"Renaming daily/{old}.csv to {new}.csv. No such file."
                )

            logger.info(f"Name Changed: {old} to {new}")

        updateNseSymbol(
            SYM_FILE,
            t.OpnPric,
            t.HghPric,
            t.LwPric,
            t.ClsPric,
            t.TtlTradgVol,
            trdCnt,
            dq,
        )

    if isinUpdated:
        isin.to_csv(ISIN_FILE)

    logger.info("EOD sync complete")


def updateNseSymbol(symFile: Path, open, high, low, close, volume, trdCnt, dq):
    "Appends EOD stock data to end of file"

    text = b""

    if not symFile.is_file():
        text += headerText

    avgTrdCnt = "" if trdCnt == "" else round(volume / trdCnt, 2)

    text += bytes(
        f"{dates.pandasDt},{open},{high},{low},{close},{volume},{trdCnt},{avgTrdCnt},{dq}\n",
        encoding="utf-8",
    ) # TODO fix duplicating

    with symFile.open("ab") as f:
        f.write(text)

    if hook and hasattr(hook, "updateNseSymbol"):
        hook.updateNseSymbol(
            dates.dt,
            symFile.stem,
            open,
            high,
            low,
            close,
            volume,
            trdCnt,
            avgTrdCnt,
            dq,
        )


def getSplit(sym, string):
    """Run a regex search for splits related corporate action and
    return the adjustment factor"""

    match = splitRegex.search(string)

    if match is None:
        logger.warning(f"{sym}: Not Matched. {string}")
        return match

    return float(match.group(1)) / float(match.group(2))


def getBonus(sym, string):
    """Run a regex search for bonus related corporate action and
    return the adjustment factor"""

    match = bonusRegex.search(string)

    if match is None:
        logger.warning(f"{sym}: Not Matched. {string}")
        return match

    return 1 + int(match.group(1)) / int(match.group(2))


def makeAdjustment(
        symbol: str,
        adjustmentFactor: float,
        prev_commit: Optional[dict[str, Union[pd.DataFrame, Path]]] = None,
) -> Optional[Tuple[pd.DataFrame, Path]]:
    """Makes adjustment to stock data prior to ex date,
    returning a tuple of pandas pd.DataFrame and filename"""

    if prev_commit:
        file: Path = prev_commit["file"]
        df: pd.DataFrame = prev_commit["df"]
    else:
        file = DAILY_FOLDER / f"{symbol.lower()}.csv"

        if not file.is_file():
            logger.warning(f"{symbol}: File not found")
            return

        df = pd.read_csv(file, index_col="Date", parse_dates=["Date"])

    last = None

    # Remove timezone info as DataFrame index is not timezone aware
    dt = dates.dt.replace(tzinfo=None)

    if dt in df.index:
        idx = df.index.get_loc(dt)

        last = df.iloc[idx:]

        df = df.iloc[:idx].copy()

    for col in ("Open", "High", "Low", "Close"):
        # nearest 0.05 = round(nu / 0.05) * 0.05
        df[col] = ((df[col] / adjustmentFactor / 0.05).round() * 0.05).round(2)

    if last is not None:
        df = pd.concat([df, last])

    return (df, file)


def updateIndice(sym, open, high, low, close, volume):
    "Appends Index EOD data to end of file"

    file = DAILY_FOLDER / f"{sym.lower()}.csv"

    text = b""

    if not file.is_file():
        text += headerText

    text += bytes(
        f"{dates.pandasDt},{open},{high},{low},{close},{volume},,,\n",
        encoding="utf-8",
    )

    with file.open("ab") as f:
        f.write(text)

    if hook and hasattr(hook, "updateIndice"):
        hook.updateIndice(dates.dt, sym, open, high, low, close, volume)


def updateIndexEOD(file: Path):
    """Iterates over each symbol in NSE indices reports and
    update EOD data to respective csv file"""

    folder = DATA_DIR / "nseIndices" / str(dates.dt.year)

    if not folder.is_dir():
        folder.mkdir(parents=True)

    df = pd.read_csv(file, index_col="Index Name")

    df.to_csv(folder / file.name)

    indices = (
        (DATA_DIR / "sector_watchlist.csv")
        .read_text()
        .strip()
        .split("\n")
    )

    cols = [
        "Open Index Value",
        "High Index Value",
        "Low Index Value",
        "Closing Index Value",
        "Volume",
    ]

    # replace all '-' in columns with 0
    for col in cols:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

    for sym in indices:
        open, high, low, close, volume = df.loc[sym, cols]

        updateIndice(sym, open, high, low, close, volume)

    pe = float(df.at["Nifty 50", "P/E"])

    if pe >= 25 or pe <= 20:
        logger.info(f"\033[1;32m### Alert: Nifty PE at {pe}! ###\033[0;94m")
    else:
        logger.info(f"### Nifty PE at {pe} ###")

    logger.info("Index sync complete.")


def adjustNseStocks():
    """Iterates over NSE corporate actions searching for splits or bonus
    on current date and adjust the stock accordingly"""

    logger.info("Making adjustments for splits and bonus")

    dtStr = dates.dt.strftime("%d-%b-%Y")

    for actions in ("equityActions", "smeActions"):
        # Store all pd.DataFrames with associated files names to be saved to file
        # if no error occurs
        df_commits: dict[str, dict[str, Union[pd.DataFrame, Path]]] = {}
        post_commits: List[Tuple[str, float]] = []
        error_context = None

        try:
            for act in meta[actions]:
                sym = act["symbol"]
                purpose = act["subject"].lower()
                ex = act["exDate"]
                series = act["series"]

                if series not in ("EQ", "BE", "BZ", "SM", "ST"):
                    continue

                if series in ("SM", "ST"):
                    sym += "_sme"

                if ("split" in purpose or "splt" in purpose) and ex == dtStr:
                    error_context = f"{sym} - Split - {dtStr}"
                    adjustmentFactor = getSplit(sym, purpose)

                    if adjustmentFactor is None:
                        continue

                    commit = makeAdjustment(
                        sym, adjustmentFactor, df_commits.get(sym, None)
                    )

                    if commit:
                        df, file = commit

                        if sym in df_commits:
                            df_commits[sym]["df"] = df
                        else:
                            df_commits[sym] = {"file": file, "df": df}

                        post_commits.append((sym, adjustmentFactor))
                        logger.info(f"{sym}: {purpose}")

                if "bonus" in purpose and ex == dtStr:
                    error_context = f"{sym} - Bonus - {dtStr}"
                    adjustmentFactor = getBonus(sym, purpose)

                    if adjustmentFactor is None:
                        continue

                    commit = makeAdjustment(
                        sym, adjustmentFactor, df_commits.get(sym, None)
                    )

                    if commit:
                        df, file = commit

                        if sym in df_commits:
                            df_commits[sym]["df"] = df
                        else:
                            df_commits[sym] = {"file": file, "df": df}

                        post_commits.append((sym, adjustmentFactor))
                        logger.info(f"{sym}: {purpose}")

        except Exception as e:
            logging.critical(f"Adjustment Error - Context {error_context}")
            # discard all pd.DataFrames and raise error,
            # so changes can be rolled back
            df_commits.clear()
            raise e

        # commit changes
        for commit in df_commits.values():
            file: Path = commit["file"]
            df: pd.DataFrame = commit["df"]

            df.to_csv(file)

        df_commits.clear()

        if hook and hasattr(hook, "makeAdjustment") and post_commits:
            hook.makeAdjustment(dates.dt, post_commits)

        post_commits.clear()


def getLastDate(file):
    "Get the last updated date for a stock csv file"

    # source: https://stackoverflow.com/a/68413780
    with open(file, "rb") as f:
        try:
            # seek 2 bytes to the last line ending ( \n )
            f.seek(-2, os.SEEK_END)

            # seek backwards 2 bytes till the next line ending
            while f.read(1) != b"\n":
                f.seek(-2, os.SEEK_CUR)

        except OSError:
            # catch OSError in case of a one line file
            f.seek(0)

        # we have the last line
        lastLine = f.readline()

    # extract date being the first item separated by comma
    return lastLine[: lastLine.find(b",")].decode()


def deleteLastLineByDate(file: Path, date_str: str) -> bool:
    """
    Truncate the last line if line starts with date_str
    """

    # Get the file size
    file_size = os.path.getsize(file)

    if file_size == 0:
        return False

    date_bytes = bytes(date_str, encoding="utf-8")

    # Open the file in read-only mode
    with file.open("r+b") as f:

        # Start searching from the end of the file
        cur_pos = file_size - 2
        f.seek(cur_pos)

        # Search backward till the newline character is found
        while f.read(1) != b"\n":
            cur_pos -= 1

            try:
                f.seek(cur_pos)
            except OSError:
                break

        if f.read().startswith(date_bytes):
            f.truncate(cur_pos)
            return True
        return False


def rollback(folder: Path):
    """Iterate over all files in folder and delete any lines
    pertaining to the current date"""

    dt = dates.pandasDt
    logger.info(f"Rolling back changes from {dt}: {folder}")

    for file in folder.iterdir():
        deleteLastLineByDate(file, dt)

    logger.info("Rollback successful")

    if hook and hasattr(hook, "on_error"):
        hook.on_error()


def cleanup(filesLst):
    """Remove files downloaded from nse"""

    for file in filesLst:
        if file is None:
            continue
        file.unlink(missing_ok=True)


def cleanOutDated():
    """Delete CSV files not updated in the last 365 days"""

    logger.info("Cleaning up files")

    deadline = dates.today - timedelta(365)
    count = 0
    removed = []

    for file in DAILY_FOLDER.iterdir():
        lastUpdated = datetime.strptime(getLastDate(file), "%Y-%m-%d")

        if lastUpdated < deadline:
            removed.append(file.stem)
            file.unlink()
            count += 1

    logger.info(f"{count} files deleted")

    if hook and hasattr(hook, "cleanOutDated") and removed:
        hook.cleanOutDated(removed)


config = Config()

hook = None  # INIT_HOOK

if config.INIT_HOOK:
    hook = load_module(config.INIT_HOOK)

    if isinstance(hook, Type):
        # hook is a Class
        hook = hook()
