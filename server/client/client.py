import grpc
from api import service_pb2, service_pb2_grpc
from api import api_pb2 as api_dot_api__pb2


def run():
    # Connect to the gRPC server
    with grpc.insecure_channel('localhost:50055') as channel:
        # Create a stub (client)
        stub = service_pb2_grpc.StockWaveServiceStub(channel)

        # Create a request
        request = service_pb2.google_dot_protobuf_dot_empty__pb2.Empty()

        # Make the call
        response = stub.ListIndices(request)

        # Print the response
        print("Response received: ", response)


if __name__ == '__main__':
    run()
