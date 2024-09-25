import os

from biz.scan import is_taking_ma_support
from models.eod import EodResult
from fastapi import APIRouter
import json
from os import path
from types import NoneType

import pandas as pd
from fastapi import APIRouter

import config
from config import ROOT_DIR, INDICES_FOLDER, indicesUrl, DATA_DIR, DAILY_FOLDER
from core.db_manager import DbManager
from core.fetcher import check_and_download, get_url_content
from models.eod import EodResult, EodRequest
from config import TEMP_DIR
from core import defs
from nse import NSE
from loguru import logger

from routes.api import list_indices_stocks
from utils.utils import write_json

router = APIRouter()


@router.post("/scan_ma/{index_symbol}", response_model=EodResult)
async def scan_ma(index_symbol: str) -> EodResult:
    daily_data_dir = DAILY_FOLDER
    ma_support_symbols = []
    stocks_list = await list_indices_stocks(index_symbol=index_symbol)
    for stock in stocks_list:
        file_path = os.path.join(daily_data_dir, f"{stock['symbol']}.csv")
        if os.path.exists(file_path):
            # Load the daily data for the symbol
            daily_df = pd.read_csv(file_path)

            # Ensure the data is sorted by Date
            daily_df['Date'] = pd.to_datetime(daily_df['Date'])
            daily_df = daily_df.sort_values(by='Date')

            # Check if the stock is taking MA 44 support
            if is_taking_ma_support(daily_df):
                ma_support_symbols.append(stock['symbol'])
    result = EodResult(success=True)
    return result
