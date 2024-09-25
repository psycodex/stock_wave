from config import TEMP_DIR
from core import defs
from core.defs import meta
from nse import NSE
from loguru import logger

from utils.utils import write_json

if __name__ == "__main__":
    nse = NSE(TEMP_DIR)
    data = nse.holidays(type=nse.HOLIDAY_TRADING)

    while defs.dates.next_date():
        if defs.dates.dt.weekday() > 4:
            continue

        logger.info("Downloading for {date}", date=defs.dates.dt.strftime('%d.%m.%Y'))
        try:
            # NSE bhav copy
            BHAV_FILE = nse.equityBhavcopy(defs.dates.dt)

            # Index file
            INDEX_FILE = nse.indicesBhavcopy(defs.dates.dt)
            # except (RuntimeError, Exception) as e:
            #     logger.warning(e)

            # try:
            # NSE delivery
            DELIVERY_FILE = nse.deliveryBhavcopy(defs.dates.dt)
            # except (RuntimeError, Exception) as e:
            #     logger.warning(e)

            # try:
            defs.updateNseEOD(BHAV_FILE, DELIVERY_FILE)

            # INDEX sync
            defs.updateIndexEOD(INDEX_FILE)
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
            defs.cleanup((BHAV_FILE, DELIVERY_FILE, INDEX_FILE))

            defs.meta["lastUpdate"] = defs.dates.lastUpdate
            write_json(defs.META_FILE, defs.meta)
            nse.exit()
            exit()

        if defs.hook and hasattr(defs.hook, "on_complete"):
            defs.hook.on_complete()

        defs.cleanup((BHAV_FILE, DELIVERY_FILE, INDEX_FILE))
        defs.cleanOutDated()

        defs.meta["lastUpdate"] = defs.dates.lastUpdate = defs.dates.dt
        write_json(defs.META_FILE, defs.meta)

        logger.info(f'{defs.dates.dt:%d %b %Y}: Done\n{"-" * 52}')
    # nse.exit()
