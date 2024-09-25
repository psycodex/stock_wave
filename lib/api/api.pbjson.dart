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
    {'1': 'update_eod_request', '3': 1, '4': 1, '5': 11, '6': '.api.UpdateEodDataRequest', '9': 0, '10': 'updateEodRequest'},
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `Envelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopeDescriptor = $convert.base64Decode(
    'CghFbnZlbG9wZRJJChJ1cGRhdGVfZW9kX3JlcXVlc3QYASABKAsyGS5hcGkuVXBkYXRlRW9kRG'
    'F0YVJlcXVlc3RIAFIQdXBkYXRlRW9kUmVxdWVzdEIJCgdtZXNzYWdl');

@$core.Deprecated('Use updateEodDataRequestDescriptor instead')
const UpdateEodDataRequest$json = {
  '1': 'UpdateEodDataRequest',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateEodDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEodDataRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVFb2REYXRhUmVxdWVzdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use updateEodDataReplyDescriptor instead')
const UpdateEodDataReply$json = {
  '1': 'UpdateEodDataReply',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateEodDataReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEodDataReplyDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVFb2REYXRhUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

