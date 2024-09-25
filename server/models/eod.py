from pydantic import BaseModel


class EodRequest(BaseModel):
    # date: int
    # month: int
    # year: int
    pass


class EodResult(BaseModel):
    success: bool
