from pydantic import BaseModel


class Indices(BaseModel):
    index: str
    symbol: str
    key: str
