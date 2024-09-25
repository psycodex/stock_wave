import sys
from concurrent import futures
import grpc

from api import service_pb2_grpc
from api import api_pb2 as api_dot_api__pb2
from grpc_health.v1 import health_pb2_grpc
from grpc_health.v1 import health


class ServiceServicer(service_pb2_grpc.NumberSortingServiceServicer):
    def SortNumbers(self, request, context):
        return api_dot_api__pb2.NumberArray(numbers=sorted(request.numbers))


def serve():
    DEFAULT_PORT = 50055
    # Get the port number from the command line parameter
    port = int(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_PORT
    HOST = f'[::]:{port}'

    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))

    service_pb2_grpc.add_NumberSortingServiceServicer_to_server(ServiceServicer(), server)
    health_pb2_grpc.add_HealthServicer_to_server(health.HealthServicer(), server)

    server.add_insecure_port(HOST)
    print(f"gRPC server started and listening on {HOST}")
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    serve()
