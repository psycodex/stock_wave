//
//  Generated code. Do not modify.
//  source: api/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../google/protobuf/empty.pbjson.dart' as $0;
import 'api.pbjson.dart' as $1;

const $core.Map<$core.String, $core.dynamic> StockWaveServiceBase$json = {
  '1': 'StockWaveService',
  '2': [
    {'1': 'ListIndices', '2': '.google.protobuf.Empty', '3': '.api.ListIndicesReply', '4': {}},
    {'1': 'ListIndicesStocks', '2': '.api.ListIndicesStocksRequest', '3': '.api.ListIndicesStocksReply', '4': {}},
    {'1': 'GetStockData', '2': '.api.StockDataRequest', '3': '.api.StockDataReply', '4': {}},
  ],
};

@$core.Deprecated('Use stockWaveServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> StockWaveServiceBase$messageJson = {
  '.google.protobuf.Empty': $0.Empty$json,
  '.api.ListIndicesReply': $1.ListIndicesReply$json,
  '.api.Indices': $1.Indices$json,
  '.api.ListIndicesStocksRequest': $1.ListIndicesStocksRequest$json,
  '.api.ListIndicesStocksReply': $1.ListIndicesStocksReply$json,
  '.api.Stocks': $1.Stocks$json,
  '.api.StockDataRequest': $1.StockDataRequest$json,
  '.api.StockDataReply': $1.StockDataReply$json,
  '.api.Ohlcv': $1.Ohlcv$json,
};

/// Descriptor for `StockWaveService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List stockWaveServiceDescriptor = $convert.base64Decode(
    'ChBTdG9ja1dhdmVTZXJ2aWNlEj4KC0xpc3RJbmRpY2VzEhYuZ29vZ2xlLnByb3RvYnVmLkVtcH'
    'R5GhUuYXBpLkxpc3RJbmRpY2VzUmVwbHkiABJRChFMaXN0SW5kaWNlc1N0b2NrcxIdLmFwaS5M'
    'aXN0SW5kaWNlc1N0b2Nrc1JlcXVlc3QaGy5hcGkuTGlzdEluZGljZXNTdG9ja3NSZXBseSIAEj'
    'wKDEdldFN0b2NrRGF0YRIVLmFwaS5TdG9ja0RhdGFSZXF1ZXN0GhMuYXBpLlN0b2NrRGF0YVJl'
    'cGx5IgA=');

