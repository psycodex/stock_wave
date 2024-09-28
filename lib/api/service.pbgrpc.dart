//
//  Generated code. Do not modify.
//  source: api/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/empty.pb.dart' as $0;
import 'api.pb.dart' as $1;

export 'service.pb.dart';

@$pb.GrpcServiceName('api.StockWaveService')
class StockWaveServiceClient extends $grpc.Client {
  static final _$listIndices = $grpc.ClientMethod<$0.Empty, $1.ListIndicesReply>(
      '/api.StockWaveService/ListIndices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListIndicesReply.fromBuffer(value));
  static final _$listIndicesStocks = $grpc.ClientMethod<$1.ListIndicesStocksRequest, $1.ListIndicesStocksReply>(
      '/api.StockWaveService/ListIndicesStocks',
      ($1.ListIndicesStocksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListIndicesStocksReply.fromBuffer(value));
  static final _$getStockData = $grpc.ClientMethod<$1.StockDataRequest, $1.StockDataReply>(
      '/api.StockWaveService/GetStockData',
      ($1.StockDataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StockDataReply.fromBuffer(value));

  StockWaveServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.ListIndicesReply> listIndices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listIndices, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListIndicesStocksReply> listIndicesStocks($1.ListIndicesStocksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listIndicesStocks, request, options: options);
  }

  $grpc.ResponseFuture<$1.StockDataReply> getStockData($1.StockDataRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStockData, request, options: options);
  }
}

@$pb.GrpcServiceName('api.StockWaveService')
abstract class StockWaveServiceBase extends $grpc.Service {
  $core.String get $name => 'api.StockWaveService';

  StockWaveServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ListIndicesReply>(
        'ListIndices',
        listIndices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ListIndicesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListIndicesStocksRequest, $1.ListIndicesStocksReply>(
        'ListIndicesStocks',
        listIndicesStocks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListIndicesStocksRequest.fromBuffer(value),
        ($1.ListIndicesStocksReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StockDataRequest, $1.StockDataReply>(
        'GetStockData',
        getStockData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StockDataRequest.fromBuffer(value),
        ($1.StockDataReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.ListIndicesReply> listIndices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listIndices(call, await request);
  }

  $async.Future<$1.ListIndicesStocksReply> listIndicesStocks_Pre($grpc.ServiceCall call, $async.Future<$1.ListIndicesStocksRequest> request) async {
    return listIndicesStocks(call, await request);
  }

  $async.Future<$1.StockDataReply> getStockData_Pre($grpc.ServiceCall call, $async.Future<$1.StockDataRequest> request) async {
    return getStockData(call, await request);
  }

  $async.Future<$1.ListIndicesReply> listIndices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.ListIndicesStocksReply> listIndicesStocks($grpc.ServiceCall call, $1.ListIndicesStocksRequest request);
  $async.Future<$1.StockDataReply> getStockData($grpc.ServiceCall call, $1.StockDataRequest request);
}
