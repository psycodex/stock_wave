from pydantic import BaseModel


class Ohlcv(BaseModel):
    Date: str
    Open: float
    High: float
    Low: float
    Close: float
    Volume: int
    TOTAL_TRADES: int
    QTY_PER_TRADE: float
    QTY_PER_TRADE: float
