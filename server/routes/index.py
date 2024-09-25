from fastapi import APIRouter, Depends
from fastapi.responses import HTMLResponse

router = APIRouter()

@router.get("/")
async def get():
    return HTMLResponse("""
        <!DOCTYPE html>
        <html>
            <head>
                <title>Socket.IO Test</title>
            </head>
            <body>
                <h1>Socket.IO Test</h1>
                <script src="https://cdn.socket.io/4.0.0/socket.io.min.js"></script>
                <script>
                    var socket = io("http://localhost:8000");
                    socket.on('message', function(data) {
                        var messages = document.getElementById('messages')
                        var message = document.createElement('li')
                        var content = document.createTextNode(data)
                        message.appendChild(content)
                        messages.appendChild(message)
                    });
                    socket.on('connect', function() {
                        socket.send("Hello Server!");
                    });
                </script>
                <ul id='messages'>
                </ul>
            </body>
        </html>
        """)
