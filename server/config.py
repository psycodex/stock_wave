import json
import logging
import os
import re
from pathlib import Path
from typing import Dict
from zoneinfo import ZoneInfo
import pandas as pd

APP_VERSION = "0.0.1"
APP_NAME = "Stock Insight"
API_PREFIX = ""

IS_DEBUG = False

# ROOT_DIR = os.getcwd()
ROOT_DIR = Path(__file__).parent
DATA_DIR = ROOT_DIR / "../data"
TEMP_DIR = DATA_DIR / "temp"
DAILY_FOLDER = DATA_DIR / "daily"
INDICES_FOLDER = DATA_DIR / "indices"
ISIN_FILE = DATA_DIR / "isin.csv"
INDICES_FILE = DATA_DIR / "indices.csv"
META_FILE = DATA_DIR / "meta.json"
DATA_DB = DATA_DIR / "stock_insight.ddb"
# DATA_DB = DATA_DIR / "stock_insight.sqlite"
logger = logging.getLogger(__name__)

splitRegex = re.compile(r"(\d+\.?\d*)[/\- a-z.]+(\d+\.?\d*)")
bonusRegex = re.compile(r"(\d+) ?: ?(\d+)")
headerText = (
    b"Date,Open,High,Low,Close,Volume,TOTAL_TRADES,QTY_PER_TRADE,DLV_QTY\n"
)

INIT_HOOK = None

NSE_INDEX_MAP = {
    "https://archives.nseindia.com/content/indices/ind_nifty50list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftynext50list.csv",
    "https://archives.nseindia.com/content/indices/ind_nifty100list.csv",
    "https://archives.nseindia.com/content/indices/ind_nifty200list.csv",
    "https://archives.nseindia.com/content/indices/ind_nifty500list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftysmallcap50list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftysmallcap100list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftysmallcap250list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftymidcap50list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftymidcap100list.csv",
    "https://archives.nseindia.com/content/indices/ind_niftymidcap150list.csv",
    "https://archives.nseindia.com/content/equities/EQUITY_L.csv",
    "https://nsearchives.nseindia.com/content/fo/NSE_FO_SosScheme.csv",
}

indicesUrl = "https://www.nseindia.com/api/allIndices"


def create_folder_if_not_exist(folder_path):
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)


create_folder_if_not_exist(TEMP_DIR)
create_folder_if_not_exist(DAILY_FOLDER)
create_folder_if_not_exist(INDICES_FOLDER)
