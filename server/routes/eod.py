import json
from os import path
from types import NoneType

import pandas as pd
from fastapi import APIRouter

import config
from config import ROOT_DIR, INDICES_FOLDER, indicesUrl, DATA_DIR
from core.db_manager import DbManager
from core.fetcher import check_and_download, get_url_content
from models.eod import EodResult, EodRequest
from config import TEMP_DIR
from core import defs
from nse import NSE
from loguru import logger

from utils.utils import write_json

router = APIRouter()


@router.post("/update_eod", response_model=EodResult)
async def update_eod(request: EodRequest) -> EodResult:
    print(ROOT_DIR)
    nse = NSE(TEMP_DIR)

    while defs.dates.next_date():
        if defs.dates.dt.weekday() > 4:
            continue

        logger.info("Downloading for {date}", date=defs.dates.dt.strftime('%d.%m.%Y'))
        try:
            # NSE bhav copy
            bhav_file = nse.equityBhavcopy(defs.dates.dt)

            # Index file
            index_file = nse.indicesBhavcopy(defs.dates.dt)
            # except (RuntimeError, Exception) as e:
            #     logger.warning(e)

            # try:
            # NSE delivery
            delivery_file = nse.deliveryBhavcopy(defs.dates.dt)
            # except (RuntimeError, Exception) as e:
            #     logger.warning(e)

            # try:
            defs.updateNseEOD(bhav_file, delivery_file)

            # INDEX sync
            defs.updateIndexEOD(index_file)
        except Exception as e:
            # rollback
            logger.exception("Error during data sync.", exc_info=e)
            continue
            # defs.rollback(defs.DATA_DAILY_FOLDER)
            # defs.cleanup((BHAV_FILE, DELIVERY_FILE, INDEX_FILE))

            # defs.meta["lastUpdate"] = defs.dates.lastUpdate
            # write_json(defs.META_FILE, defs.meta)

        # Adjust Splits and bonus
        try:
            defs.adjustNseStocks()
        except Exception as e:
            logger.exception(
                "Error while making adjustments.\nAll adjustments have been discarded.",
                exc_info=e,
            )

            defs.rollback(defs.DAILY_FOLDER)
            defs.cleanup((bhav_file, delivery_file, index_file))

            defs.meta["lastUpdate"] = defs.dates.lastUpdate
            write_json(defs.META_FILE, defs.meta)
            nse.exit()
            exit()

        if defs.hook and hasattr(defs.hook, "on_complete"):
            defs.hook.on_complete()

        defs.cleanup((bhav_file, delivery_file, index_file))
        defs.cleanOutDated()

        defs.meta["lastUpdate"] = defs.dates.lastUpdate = defs.dates.dt
        write_json(defs.META_FILE, defs.meta)

        logger.info(f'{defs.dates.dt:%d %b %Y}: Done\n{"-" * 52}')

    result = EodResult(success=True)
    return result


@router.post("/update_db", response_model=EodResult)
async def update_db(request: EodRequest) -> EodResult:
    manager = DbManager()

    isin_df = pd.read_csv(str(config.ISIN_FILE))

    for index, row in isin_df.iterrows():
        symbol = row['SYMBOL'].lower()
        file_path = path.join(config.DAILY_FOLDER, f"{symbol}.csv")

        # Check if the file exists
        if path.exists(file_path):
            # Read the CSV file into a Pandas DataFrame
            stock_df = pd.read_csv(file_path)
            stock_df['Symbol'] = symbol
            stock_df = stock_df[
                ['Symbol', 'Date', 'Open', 'High', 'Low', 'Close', 'Volume', 'TOTAL_TRADES', 'QTY_PER_TRADE',
                 'DLV_QTY']]

            try:
                # create_query = f"CREATE TABLE IF NOT EXISTS '{symbol}' AS SELECT * FROM stock_df"
                # manager.connection.execute(create_query)
                # insert_query = f"INSERT INTO '{symbol}' SELECT * FROM stock_df"
                insert_query = "INSERT INTO stock_data SELECT * FROM stock_df"
                manager.connection.execute(insert_query)
                # index_query =  f"CREATE UNIQUE INDEX IF NOT EXISTS unique_date_idx ON '{symbol}' (Date)"
                # manager.connection.execute(index_query)
                # print(manager.connection.execute("SELECT * FROM stock_data LIMIT 5").fetchdf())
            except Exception as e:
                print(e)

        else:
            print(f"File for symbol {symbol} not found!")

    result = EodResult(success=True)
    return result


@router.post("/update_meta", response_model=EodResult)
async def update_meta(request: EodRequest) -> EodResult:
    await check_and_download()
    # isin_df = pd.read_csv(str(DATA_INDICES_FOLDER / "EQUITY_L.csv"))
    return EodResult(success=True)


@router.post("/update_indices", response_model=EodResult)
async def update_indices(request: EodRequest) -> EodResult:
    content = await get_url_content(indicesUrl)
    nse = NSE(download_folder=DATA_DIR)

    if content is not None and len(content) > 0:
        data = json.loads(content)

        rows = []
        for item in data['data']:
            rows.append({
                'index': item['index'],
                'indexSymbol': item['indexSymbol'],
                'key': item['key']
            })
        df = pd.DataFrame(rows)

        # Path to CSV file
        csv_file = DATA_DIR / 'indices.csv'

        try:
            existing_df = pd.read_csv(csv_file)

            # Append new data if not already present
            df = pd.concat([existing_df, df]).drop_duplicates(subset=['indexSymbol'])
            # nifty_all_df = pd.DataFrame([])
            for _, row in df.iterrows():
                indices_stocks = []
                response_json = nse.listIndexStocks(index=row['indexSymbol'])
                if response_json is None:
                    continue
                if response_json.get('data') is None:
                    continue
                print(response_json)
                for data_row in response_json.get('data'):
                    if data_row.get('meta') is not None:
                        indices_stocks.append({
                            'symbol': data_row['symbol'],
                            'companyName': data_row['meta'].get('companyName', ''),
                            'isin': data_row['meta'].get('isin', ''),
                            'industry': data_row['meta'].get('industry', ''),
                        })
                indices_stocks_df = pd.DataFrame(indices_stocks)
                indices_stocks_df.to_csv(str(INDICES_FOLDER / f"{row['indexSymbol']}.csv"), index=False)
                # nifty_all_df= pd.concat([nifty_all_df, indices_stocks_df]).drop_duplicates(subset=['symbol'])

        except FileNotFoundError:
            # If CSV file does not exist, create a new one
            df.to_csv(csv_file, index=False)
            print(f'CSV file "{csv_file}" created with new data.')
            exit()

        # nifty_all_df.to_csv(str(INDICES_FOLDER / "NIFTY ALL.csv"), index=False)

        # Save DataFrame to CSV
        df.to_csv(csv_file, index=False)
        print(f'CSV file "{csv_file}" updated with new data.')
    return EodResult(success=True)

# https://www.nseindia.com/api/historical/indicesHistory?indexType=NIFTY%2050&from=02-03-2024&to=02-09-2024
# https://www.nseindia.com/market-data/live-market-indices
