from typing import List, Type, Union, Optional

import grpc

from api import service_pb2_grpc
from api import api_pb2
import pandas as pd

import config
from fastapi import APIRouter, Query

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
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details('File not found')
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
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details('File not found')
            logger.error(f"File not found: {e}")
        return reply

    def GetStockData(self, request, context):
        reply = api_pb2.StockDataReply()
        try:
            df = pd.read_csv(str(config.DAILY_FOLDER / (request.symbol + ".csv")))
        except FileNotFoundError:
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details('File not found')
            return reply

        df['Date'] = pd.to_datetime(df['Date'])
        df = df.fillna(0)
        if request.start_date:
            df = df[df['Date'] >= pd.to_datetime(request.start_date)]
        if request.end_date:
            df = df[df['Date'] <= pd.to_datetime(request.end_date)]

        df['Date'] = df['Date'].dt.strftime('%Y-%m-%d')
        result = df.to_dict(orient='records')

        for record in result:
            stock_data = reply.ohlcv.add()
            stock_data.date = record['Date']
            stock_data.open = record['Open']
            stock_data.high = record['High']
            stock_data.low = record['Low']
            stock_data.close = record['Close']
            stock_data.volume = record['Volume']
            stock_data.total_trades = record['TOTAL_TRADES']

        return reply
