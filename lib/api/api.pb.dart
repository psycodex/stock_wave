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

class Ohlcv extends $pb.GeneratedMessage {
  factory Ohlcv({
    $core.String? date,
    $core.double? open,
    $core.double? high,
    $core.double? low,
    $core.double? close,
    $core.double? volume,
    $core.double? totalTrades,
    $core.double? qtyPerTrade,
  }) {
    final $result = create();
    if (date != null) {
      $result.date = date;
    }
    if (open != null) {
      $result.open = open;
    }
    if (high != null) {
      $result.high = high;
    }
    if (low != null) {
      $result.low = low;
    }
    if (close != null) {
      $result.close = close;
    }
    if (volume != null) {
      $result.volume = volume;
    }
    if (totalTrades != null) {
      $result.totalTrades = totalTrades;
    }
    if (qtyPerTrade != null) {
      $result.qtyPerTrade = qtyPerTrade;
    }
    return $result;
  }
  Ohlcv._() : super();
  factory Ohlcv.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ohlcv.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ohlcv', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'date')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'open', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'high', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'low', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'close', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'volume', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'totalTrades', $pb.PbFieldType.OD)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'qtyPerTrade', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ohlcv clone() => Ohlcv()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ohlcv copyWith(void Function(Ohlcv) updates) => super.copyWith((message) => updates(message as Ohlcv)) as Ohlcv;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ohlcv create() => Ohlcv._();
  Ohlcv createEmptyInstance() => create();
  static $pb.PbList<Ohlcv> createRepeated() => $pb.PbList<Ohlcv>();
  @$core.pragma('dart2js:noInline')
  static Ohlcv getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ohlcv>(create);
  static Ohlcv? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get date => $_getSZ(0);
  @$pb.TagNumber(1)
  set date($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get open => $_getN(1);
  @$pb.TagNumber(2)
  set open($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOpen() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpen() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get high => $_getN(2);
  @$pb.TagNumber(3)
  set high($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHigh() => $_has(2);
  @$pb.TagNumber(3)
  void clearHigh() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get low => $_getN(3);
  @$pb.TagNumber(4)
  set low($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLow() => $_has(3);
  @$pb.TagNumber(4)
  void clearLow() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get close => $_getN(4);
  @$pb.TagNumber(5)
  set close($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasClose() => $_has(4);
  @$pb.TagNumber(5)
  void clearClose() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get volume => $_getN(5);
  @$pb.TagNumber(6)
  set volume($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVolume() => $_has(5);
  @$pb.TagNumber(6)
  void clearVolume() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalTrades => $_getN(6);
  @$pb.TagNumber(7)
  set totalTrades($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalTrades() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalTrades() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get qtyPerTrade => $_getN(7);
  @$pb.TagNumber(8)
  set qtyPerTrade($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasQtyPerTrade() => $_has(7);
  @$pb.TagNumber(8)
  void clearQtyPerTrade() => clearField(8);
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

class StockDataRequest extends $pb.GeneratedMessage {
  factory StockDataRequest({
    $core.String? symbol,
    $core.String? startDate,
    $core.String? endDate,
  }) {
    final $result = create();
    if (symbol != null) {
      $result.symbol = symbol;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (endDate != null) {
      $result.endDate = endDate;
    }
    return $result;
  }
  StockDataRequest._() : super();
  factory StockDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StockDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StockDataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'symbol')
    ..aOS(2, _omitFieldNames ? '' : 'startDate')
    ..aOS(3, _omitFieldNames ? '' : 'endDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StockDataRequest clone() => StockDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StockDataRequest copyWith(void Function(StockDataRequest) updates) => super.copyWith((message) => updates(message as StockDataRequest)) as StockDataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockDataRequest create() => StockDataRequest._();
  StockDataRequest createEmptyInstance() => create();
  static $pb.PbList<StockDataRequest> createRepeated() => $pb.PbList<StockDataRequest>();
  @$core.pragma('dart2js:noInline')
  static StockDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StockDataRequest>(create);
  static StockDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get startDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set startDate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get endDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set endDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => clearField(3);
}

class StockDataReply extends $pb.GeneratedMessage {
  factory StockDataReply({
    $core.Iterable<Ohlcv>? ohlcv,
  }) {
    final $result = create();
    if (ohlcv != null) {
      $result.ohlcv.addAll(ohlcv);
    }
    return $result;
  }
  StockDataReply._() : super();
  factory StockDataReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StockDataReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StockDataReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Ohlcv>(1, _omitFieldNames ? '' : 'ohlcv', $pb.PbFieldType.PM, subBuilder: Ohlcv.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StockDataReply clone() => StockDataReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StockDataReply copyWith(void Function(StockDataReply) updates) => super.copyWith((message) => updates(message as StockDataReply)) as StockDataReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockDataReply create() => StockDataReply._();
  StockDataReply createEmptyInstance() => create();
  static $pb.PbList<StockDataReply> createRepeated() => $pb.PbList<StockDataReply>();
  @$core.pragma('dart2js:noInline')
  static StockDataReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StockDataReply>(create);
  static StockDataReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Ohlcv> get ohlcv => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
