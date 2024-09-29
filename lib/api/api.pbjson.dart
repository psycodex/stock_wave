//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use envelopeDescriptor instead')
const Envelope$json = {
  '1': 'Envelope',
  '2': [
    {'1': 'hello', '3': 1, '4': 1, '5': 11, '6': '.api.Hello', '9': 0, '10': 'hello'},
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `Envelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopeDescriptor = $convert.base64Decode(
    'CghFbnZlbG9wZRIiCgVoZWxsbxgBIAEoCzIKLmFwaS5IZWxsb0gAUgVoZWxsb0IJCgdtZXNzYW'
    'dl');

@$core.Deprecated('Use helloDescriptor instead')
const Hello$json = {
  '1': 'Hello',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Hello`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloDescriptor = $convert.base64Decode(
    'CgVIZWxsbxIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use indicesDescriptor instead')
const Indices$json = {
  '1': 'Indices',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 9, '10': 'index'},
    {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'key', '3': 3, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `Indices`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indicesDescriptor = $convert.base64Decode(
    'CgdJbmRpY2VzEhQKBWluZGV4GAEgASgJUgVpbmRleBIWCgZzeW1ib2wYAiABKAlSBnN5bWJvbB'
    'IQCgNrZXkYAyABKAlSA2tleQ==');

@$core.Deprecated('Use stocksDescriptor instead')
const Stocks$json = {
  '1': 'Stocks',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'key', '3': 3, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `Stocks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stocksDescriptor = $convert.base64Decode(
    'CgZTdG9ja3MSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZzeW1ib2wYAiABKAlSBnN5bWJvbBIQCg'
    'NrZXkYAyABKAlSA2tleQ==');

@$core.Deprecated('Use ohlcvDescriptor instead')
const Ohlcv$json = {
  '1': 'Ohlcv',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 9, '10': 'date'},
    {'1': 'open', '3': 2, '4': 1, '5': 2, '10': 'open'},
    {'1': 'high', '3': 3, '4': 1, '5': 2, '10': 'high'},
    {'1': 'low', '3': 4, '4': 1, '5': 2, '10': 'low'},
    {'1': 'close', '3': 5, '4': 1, '5': 2, '10': 'close'},
    {'1': 'volume', '3': 6, '4': 1, '5': 1, '10': 'volume'},
    {'1': 'total_trades', '3': 7, '4': 1, '5': 1, '10': 'totalTrades'},
    {'1': 'qty_per_trade', '3': 8, '4': 1, '5': 1, '10': 'qtyPerTrade'},
  ],
};

/// Descriptor for `Ohlcv`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ohlcvDescriptor = $convert.base64Decode(
    'CgVPaGxjdhISCgRkYXRlGAEgASgJUgRkYXRlEhIKBG9wZW4YAiABKAJSBG9wZW4SEgoEaGlnaB'
    'gDIAEoAlIEaGlnaBIQCgNsb3cYBCABKAJSA2xvdxIUCgVjbG9zZRgFIAEoAlIFY2xvc2USFgoG'
    'dm9sdW1lGAYgASgBUgZ2b2x1bWUSIQoMdG90YWxfdHJhZGVzGAcgASgBUgt0b3RhbFRyYWRlcx'
    'IiCg1xdHlfcGVyX3RyYWRlGAggASgBUgtxdHlQZXJUcmFkZQ==');

@$core.Deprecated('Use listIndicesReplyDescriptor instead')
const ListIndicesReply$json = {
  '1': 'ListIndicesReply',
  '2': [
    {'1': 'indices', '3': 1, '4': 3, '5': 11, '6': '.api.Indices', '10': 'indices'},
  ],
};

/// Descriptor for `ListIndicesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIndicesReplyDescriptor = $convert.base64Decode(
    'ChBMaXN0SW5kaWNlc1JlcGx5EiYKB2luZGljZXMYASADKAsyDC5hcGkuSW5kaWNlc1IHaW5kaW'
    'Nlcw==');

@$core.Deprecated('Use listIndicesStocksRequestDescriptor instead')
const ListIndicesStocksRequest$json = {
  '1': 'ListIndicesStocksRequest',
  '2': [
    {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
  ],
};

/// Descriptor for `ListIndicesStocksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIndicesStocksRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0SW5kaWNlc1N0b2Nrc1JlcXVlc3QSFgoGc3ltYm9sGAEgASgJUgZzeW1ib2w=');

@$core.Deprecated('Use listIndicesStocksReplyDescriptor instead')
const ListIndicesStocksReply$json = {
  '1': 'ListIndicesStocksReply',
  '2': [
    {'1': 'stocks', '3': 1, '4': 3, '5': 11, '6': '.api.Stocks', '10': 'stocks'},
  ],
};

/// Descriptor for `ListIndicesStocksReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIndicesStocksReplyDescriptor = $convert.base64Decode(
    'ChZMaXN0SW5kaWNlc1N0b2Nrc1JlcGx5EiMKBnN0b2NrcxgBIAMoCzILLmFwaS5TdG9ja3NSBn'
    'N0b2Nrcw==');

@$core.Deprecated('Use stockDataRequestDescriptor instead')
const StockDataRequest$json = {
  '1': 'StockDataRequest',
  '2': [
    {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'start_date', '3': 2, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 3, '4': 1, '5': 9, '10': 'endDate'},
  ],
};

/// Descriptor for `StockDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockDataRequestDescriptor = $convert.base64Decode(
    'ChBTdG9ja0RhdGFSZXF1ZXN0EhYKBnN5bWJvbBgBIAEoCVIGc3ltYm9sEh0KCnN0YXJ0X2RhdG'
    'UYAiABKAlSCXN0YXJ0RGF0ZRIZCghlbmRfZGF0ZRgDIAEoCVIHZW5kRGF0ZQ==');

@$core.Deprecated('Use stockDataReplyDescriptor instead')
const StockDataReply$json = {
  '1': 'StockDataReply',
  '2': [
    {'1': 'ohlcv', '3': 1, '4': 3, '5': 11, '6': '.api.Ohlcv', '10': 'ohlcv'},
  ],
};

/// Descriptor for `StockDataReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockDataReplyDescriptor = $convert.base64Decode(
    'Cg5TdG9ja0RhdGFSZXBseRIgCgVvaGxjdhgBIAMoCzIKLmFwaS5PaGxjdlIFb2hsY3Y=');

