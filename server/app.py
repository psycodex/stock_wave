import logging
import sys
from concurrent import futures
import grpc
from loguru import logger

from api import service_pb2_grpc
from grpc_health.v1 import health_pb2_grpc
from grpc_health.v1 import health

from routes.api import StockWaveService

logger.remove()
logger.add(
    sys.stdout,
    format="{message}",  # Raw message output
    serialize=True  # Serialize logs to JSON
)


class InterceptHandler(logging.Handler):
    def emit(self, record):
        logger_opt = logger.opt(depth=6, exception=record.exc_info)
        logger_opt.log(record.levelname, record.getMessage())


logging.basicConfig(handlers=[InterceptHandler()], level=logging.DEBUG)
logging.getLogger('grpc').setLevel(logging.DEBUG)


def serve():
    DEFAULT_PORT = 50055
    # Get the port number from the command line parameter
    port = int(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_PORT
    HOST = f'[::]:{port}'

    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))

    service_pb2_grpc.add_StockWaveServiceServicer_to_server(StockWaveService(), server)
    health_pb2_grpc.add_HealthServicer_to_server(health.HealthServicer(), server)

    server.add_insecure_port(HOST)
    logger.info(f"gRPC server started and listening on {HOST}")

    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    serve()
