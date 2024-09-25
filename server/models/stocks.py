from pydantic import BaseModel


class Stocks(BaseModel):
    name: str
    symbol: str
    # key: str
    pass
