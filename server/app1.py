import sys

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import socketio
import uvicorn
from socketio import ASGIApp
from routes.router import api_router
from config import API_PREFIX, APP_NAME, APP_VERSION, IS_DEBUG
from loguru import logger
import json


def get_app() -> ASGIApp:
    fast_app = FastAPI(title=APP_NAME, version=APP_VERSION, debug=IS_DEBUG)
    fast_app.include_router(api_router, prefix=API_PREFIX)

    # Create a new Async Socket.IO server
    sio = socketio.AsyncServer(
        async_mode='asgi',
        cors_allowed_origins="*"
    )

    sio_app = socketio.ASGIApp(sio, other_asgi_app=fast_app)

    fast_app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],  # Allows all origins
        allow_credentials=True,
        allow_methods=["*"],  # Allows all HTTP methods
        allow_headers=["*"],  # Allows all headers
    )

    # Define an event handler for client connections
    @sio.event
    async def connect(sid, environ):
        print(f"Client connected: {sid}")

    # Define an event handler for messages from the client
    @sio.event
    async def message(sid, data):
        print(f"Message from {sid}: {data}")
        await sio.emit('message', f"Message text was: {data}", to=sid)

    # Define an event handler for client disconnections
    @sio.event
    async def disconnect(sid):
        print(f"Client disconnected: {sid}")

    return sio_app


if __name__ == "__main__":
    # Configure Loguru to use JSON output
    logger.remove()  # Remove default logger
    logger.add(
        sys.stdout,
        format="{message}",  # Raw message output
        serialize=True  # Serialize logs to JSON
    )
    sio_app = get_app()
    uvicorn.run(sio_app, host="127.0.0.1", port=8000)
