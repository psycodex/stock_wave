from fastapi import APIRouter

from routes import index, eod, api

api_router = APIRouter()
api_router.include_router(index.router, tags=["index"], prefix="/index")
api_router.include_router(eod.router, tags=["eod"], prefix="/eod")
api_router.include_router(api.router, tags=["api"], prefix="/api")
