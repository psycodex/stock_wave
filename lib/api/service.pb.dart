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

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/empty.pb.dart' as $0;
import 'api.pb.dart' as $1;

class StockWaveServiceApi {
  $pb.RpcClient _client;
  StockWaveServiceApi(this._client);

  $async.Future<$1.ListIndicesReply> listIndices($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<$1.ListIndicesReply>(ctx, 'StockWaveService', 'ListIndices', request, $1.ListIndicesReply())
  ;
  $async.Future<$1.ListIndicesStocksReply> listIndicesStocks($pb.ClientContext? ctx, $1.ListIndicesStocksRequest request) =>
    _client.invoke<$1.ListIndicesStocksReply>(ctx, 'StockWaveService', 'ListIndicesStocks', request, $1.ListIndicesStocksReply())
  ;
  $async.Future<$1.StockDataReply> getStockData($pb.ClientContext? ctx, $1.StockDataRequest request) =>
    _client.invoke<$1.StockDataReply>(ctx, 'StockWaveService', 'GetStockData', request, $1.StockDataReply())
  ;
}

