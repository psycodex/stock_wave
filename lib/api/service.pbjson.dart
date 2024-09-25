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

@$core.Deprecated('Use numberArrayDescriptor instead')
const NumberArray$json = {
  '1': 'NumberArray',
  '2': [
    {'1': 'numbers', '3': 1, '4': 3, '5': 5, '10': 'numbers'},
  ],
};

/// Descriptor for `NumberArray`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberArrayDescriptor = $convert.base64Decode(
    'CgtOdW1iZXJBcnJheRIYCgdudW1iZXJzGAEgAygFUgdudW1iZXJz');

const $core.Map<$core.String, $core.dynamic> NumberSortingServiceBase$json = {
  '1': 'NumberSortingService',
  '2': [
    {'1': 'SortNumbers', '2': '.NumberArray', '3': '.NumberArray', '4': {}},
  ],
};

@$core.Deprecated('Use numberSortingServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> NumberSortingServiceBase$messageJson = {
  '.NumberArray': NumberArray$json,
};

/// Descriptor for `NumberSortingService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List numberSortingServiceDescriptor = $convert.base64Decode(
    'ChROdW1iZXJTb3J0aW5nU2VydmljZRIrCgtTb3J0TnVtYmVycxIMLk51bWJlckFycmF5GgwuTn'
    'VtYmVyQXJyYXkiAA==');

