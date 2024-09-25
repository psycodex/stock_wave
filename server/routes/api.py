from datetime import datetime, timedelta
from typing import List, Type, Union, Optional

import pandas as pd
from starlette.responses import JSONResponse

import config
from fastapi import APIRouter, Query

from models.Ohlcv import Ohlcv
from models.indices import Indices
from models.stocks import Stocks
from fastapi.responses import JSONResponse

router = APIRouter()


@router.get("/list_indices", response_model=List[Indices])
async def list_indices() -> List[Indices]:
    indices_list: List[Indices] = []
    indices_content = pd.read_csv(str(config.INDICES_FILE))
    for _, row in indices_content.iterrows():
        index_obj = Indices(index=row['index'], symbol=row['indexSymbol'], key=row['key'])
        indices_list.append(index_obj)
    return indices_list


@router.get("/list_indices_stocks/{index_symbol}", response_model=List[Stocks])
async def list_indices_stocks(index_symbol: str) -> List[Stocks]:
    stocks_list: List[Stocks] = []
    try:
        indices_content = pd.read_csv(str(config.INDICES_FOLDER / (index_symbol + ".csv")))
        for _, row in indices_content.iterrows():
            stock_obj = Stocks(
                name=row['companyName'],
                symbol=row['symbol']
            )
            stocks_list.append(stock_obj)
    except FileNotFoundError:
        pass
    return stocks_list


@router.get("/get_stocks_data/{symbol}", response_model=List[Ohlcv])
async def get_stocks_data(symbol: str, start_date: Optional[str] = Query(None),
                          end_date: Optional[str] = Query(None)) -> JSONResponse:
    try:
        df = pd.read_csv(str(config.DAILY_FOLDER / (symbol + ".csv")))
    except FileNotFoundError:
        return JSONResponse(content=[])

    df['Date'] = pd.to_datetime(df['Date'])
    df = df.fillna(0)
    if start_date:
        df = df[df['Date'] >= pd.to_datetime(start_date)]
    if end_date:
        df = df[df['Date'] <= pd.to_datetime(end_date)]

    df['Date'] = df['Date'].dt.strftime('%Y-%m-%d')
    selected_columns = ['Date', 'Open', 'High', 'Low', 'Close', 'Volume']
    result = df[selected_columns].to_dict(orient='records')

    return JSONResponse(content=result)
