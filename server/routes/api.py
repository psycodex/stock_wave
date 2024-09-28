from typing import List, Type, Union, Optional
from api import service_pb2_grpc
from api import api_pb2
import pandas as pd

import config
from fastapi import APIRouter, Query

from models.Ohlcv import Ohlcv
from models.indices import Indices
from models.stocks import Stocks
from fastapi.responses import JSONResponse
from loguru import logger

router = APIRouter()


class StockWaveService(service_pb2_grpc.StockWaveServiceServicer):
    def ListIndices(self, request, context):
        reply = api_pb2.ListIndicesReply()
        try:
            indices_content = pd.read_csv(str(config.INDICES_FILE))
            for _, row in indices_content.iterrows():
                index_obj = reply.indices.add()
                index_obj.index = row['index']
                index_obj.symbol = row['indexSymbol']
                index_obj.key = row['key']
        except FileNotFoundError as e:
            logger.error(f"File not found: {e}")

        return reply

    def ListIndicesStocks(self, request, context):
        reply = api_pb2.ListIndicesStocksReply()
        try:
            indices_content = pd.read_csv(str(config.INDICES_FOLDER / (request.symbol + ".csv")))
            for _, row in indices_content.iterrows():
                stock_obj = reply.stocks.add()
                stock_obj.name = row['companyName']
                stock_obj.symbol = row['symbol']
                # stock_obj.key = row['key']
        except FileNotFoundError as e:
            logger.error(f"File not found: {e}")
        return reply


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
