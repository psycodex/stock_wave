//
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum Envelope_Message {
  hello, 
  notSet
}

class Envelope extends $pb.GeneratedMessage {
  factory Envelope({
    Hello? hello,
  }) {
    final $result = create();
    if (hello != null) {
      $result.hello = hello;
    }
    return $result;
  }
  Envelope._() : super();
  factory Envelope.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Envelope.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Envelope_Message> _Envelope_MessageByTag = {
    1 : Envelope_Message.hello,
    0 : Envelope_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Envelope', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Hello>(1, _omitFieldNames ? '' : 'hello', subBuilder: Hello.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Envelope clone() => Envelope()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Envelope copyWith(void Function(Envelope) updates) => super.copyWith((message) => updates(message as Envelope)) as Envelope;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Envelope create() => Envelope._();
  Envelope createEmptyInstance() => create();
  static $pb.PbList<Envelope> createRepeated() => $pb.PbList<Envelope>();
  @$core.pragma('dart2js:noInline')
  static Envelope getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Envelope>(create);
  static Envelope? _defaultInstance;

  Envelope_Message whichMessage() => _Envelope_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Hello get hello => $_getN(0);
  @$pb.TagNumber(1)
  set hello(Hello v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHello() => $_has(0);
  @$pb.TagNumber(1)
  void clearHello() => clearField(1);
  @$pb.TagNumber(1)
  Hello ensureHello() => $_ensure(0);
}

class Hello extends $pb.GeneratedMessage {
  factory Hello({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  Hello._() : super();
  factory Hello.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hello.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Hello', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Hello clone() => Hello()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Hello copyWith(void Function(Hello) updates) => super.copyWith((message) => updates(message as Hello)) as Hello;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Hello create() => Hello._();
  Hello createEmptyInstance() => create();
  static $pb.PbList<Hello> createRepeated() => $pb.PbList<Hello>();
  @$core.pragma('dart2js:noInline')
  static Hello getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Hello>(create);
  static Hello? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class Indices extends $pb.GeneratedMessage {
  factory Indices({
    $core.String? index,
    $core.String? symbol,
    $core.String? key,
  }) {
    final $result = create();
    if (index != null) {
      $result.index = index;
    }
    if (symbol != null) {
      $result.symbol = symbol;
    }
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  Indices._() : super();
  factory Indices.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Indices.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Indices', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'index')
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aOS(3, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Indices clone() => Indices()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Indices copyWith(void Function(Indices) updates) => super.copyWith((message) => updates(message as Indices)) as Indices;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Indices create() => Indices._();
  Indices createEmptyInstance() => create();
  static $pb.PbList<Indices> createRepeated() => $pb.PbList<Indices>();
  @$core.pragma('dart2js:noInline')
  static Indices getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Indices>(create);
  static Indices? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get index => $_getSZ(0);
  @$pb.TagNumber(1)
  set index($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get key => $_getSZ(2);
  @$pb.TagNumber(3)
  set key($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearKey() => clearField(3);
}

class Stocks extends $pb.GeneratedMessage {
  factory Stocks({
    $core.String? name,
    $core.String? symbol,
    $core.String? key,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (symbol != null) {
      $result.symbol = symbol;
    }
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  Stocks._() : super();
  factory Stocks.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Stocks.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Stocks', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aOS(3, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Stocks clone() => Stocks()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Stocks copyWith(void Function(Stocks) updates) => super.copyWith((message) => updates(message as Stocks)) as Stocks;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Stocks create() => Stocks._();
  Stocks createEmptyInstance() => create();
  static $pb.PbList<Stocks> createRepeated() => $pb.PbList<Stocks>();
  @$core.pragma('dart2js:noInline')
  static Stocks getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stocks>(create);
  static Stocks? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get key => $_getSZ(2);
  @$pb.TagNumber(3)
  set key($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearKey() => clearField(3);
}

class ListIndicesReply extends $pb.GeneratedMessage {
  factory ListIndicesReply({
    $core.Iterable<Indices>? indices,
  }) {
    final $result = create();
    if (indices != null) {
      $result.indices.addAll(indices);
    }
    return $result;
  }
  ListIndicesReply._() : super();
  factory ListIndicesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListIndicesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListIndicesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Indices>(1, _omitFieldNames ? '' : 'indices', $pb.PbFieldType.PM, subBuilder: Indices.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListIndicesReply clone() => ListIndicesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListIndicesReply copyWith(void Function(ListIndicesReply) updates) => super.copyWith((message) => updates(message as ListIndicesReply)) as ListIndicesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListIndicesReply create() => ListIndicesReply._();
  ListIndicesReply createEmptyInstance() => create();
  static $pb.PbList<ListIndicesReply> createRepeated() => $pb.PbList<ListIndicesReply>();
  @$core.pragma('dart2js:noInline')
  static ListIndicesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListIndicesReply>(create);
  static ListIndicesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Indices> get indices => $_getList(0);
}

class ListIndicesStocksRequest extends $pb.GeneratedMessage {
  factory ListIndicesStocksRequest({
    $core.String? symbol,
  }) {
    final $result = create();
    if (symbol != null) {
      $result.symbol = symbol;
    }
    return $result;
  }
  ListIndicesStocksRequest._() : super();
  factory ListIndicesStocksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListIndicesStocksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListIndicesStocksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'symbol')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListIndicesStocksRequest clone() => ListIndicesStocksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListIndicesStocksRequest copyWith(void Function(ListIndicesStocksRequest) updates) => super.copyWith((message) => updates(message as ListIndicesStocksRequest)) as ListIndicesStocksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListIndicesStocksRequest create() => ListIndicesStocksRequest._();
  ListIndicesStocksRequest createEmptyInstance() => create();
  static $pb.PbList<ListIndicesStocksRequest> createRepeated() => $pb.PbList<ListIndicesStocksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListIndicesStocksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListIndicesStocksRequest>(create);
  static ListIndicesStocksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);
}

class ListIndicesStocksReply extends $pb.GeneratedMessage {
  factory ListIndicesStocksReply({
    $core.Iterable<Stocks>? stocks,
  }) {
    final $result = create();
    if (stocks != null) {
      $result.stocks.addAll(stocks);
    }
    return $result;
  }
  ListIndicesStocksReply._() : super();
  factory ListIndicesStocksReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListIndicesStocksReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListIndicesStocksReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Stocks>(1, _omitFieldNames ? '' : 'stocks', $pb.PbFieldType.PM, subBuilder: Stocks.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListIndicesStocksReply clone() => ListIndicesStocksReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListIndicesStocksReply copyWith(void Function(ListIndicesStocksReply) updates) => super.copyWith((message) => updates(message as ListIndicesStocksReply)) as ListIndicesStocksReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListIndicesStocksReply create() => ListIndicesStocksReply._();
  ListIndicesStocksReply createEmptyInstance() => create();
  static $pb.PbList<ListIndicesStocksReply> createRepeated() => $pb.PbList<ListIndicesStocksReply>();
  @$core.pragma('dart2js:noInline')
  static ListIndicesStocksReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListIndicesStocksReply>(create);
  static ListIndicesStocksReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Stocks> get stocks => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
