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
  updateEodRequest, 
  notSet
}

class Envelope extends $pb.GeneratedMessage {
  factory Envelope({
    UpdateEodDataRequest? updateEodRequest,
  }) {
    final $result = create();
    if (updateEodRequest != null) {
      $result.updateEodRequest = updateEodRequest;
    }
    return $result;
  }
  Envelope._() : super();
  factory Envelope.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Envelope.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Envelope_Message> _Envelope_MessageByTag = {
    1 : Envelope_Message.updateEodRequest,
    0 : Envelope_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Envelope', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<UpdateEodDataRequest>(1, _omitFieldNames ? '' : 'updateEodRequest', subBuilder: UpdateEodDataRequest.create)
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
  UpdateEodDataRequest get updateEodRequest => $_getN(0);
  @$pb.TagNumber(1)
  set updateEodRequest(UpdateEodDataRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdateEodRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdateEodRequest() => clearField(1);
  @$pb.TagNumber(1)
  UpdateEodDataRequest ensureUpdateEodRequest() => $_ensure(0);
}

class UpdateEodDataRequest extends $pb.GeneratedMessage {
  factory UpdateEodDataRequest({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UpdateEodDataRequest._() : super();
  factory UpdateEodDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEodDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEodDataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEodDataRequest clone() => UpdateEodDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEodDataRequest copyWith(void Function(UpdateEodDataRequest) updates) => super.copyWith((message) => updates(message as UpdateEodDataRequest)) as UpdateEodDataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEodDataRequest create() => UpdateEodDataRequest._();
  UpdateEodDataRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateEodDataRequest> createRepeated() => $pb.PbList<UpdateEodDataRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateEodDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEodDataRequest>(create);
  static UpdateEodDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class UpdateEodDataReply extends $pb.GeneratedMessage {
  factory UpdateEodDataReply({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UpdateEodDataReply._() : super();
  factory UpdateEodDataReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEodDataReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEodDataReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEodDataReply clone() => UpdateEodDataReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEodDataReply copyWith(void Function(UpdateEodDataReply) updates) => super.copyWith((message) => updates(message as UpdateEodDataReply)) as UpdateEodDataReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEodDataReply create() => UpdateEodDataReply._();
  UpdateEodDataReply createEmptyInstance() => create();
  static $pb.PbList<UpdateEodDataReply> createRepeated() => $pb.PbList<UpdateEodDataReply>();
  @$core.pragma('dart2js:noInline')
  static UpdateEodDataReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEodDataReply>(create);
  static UpdateEodDataReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class NumberArray extends $pb.GeneratedMessage {
  factory NumberArray({
    $core.Iterable<$core.int>? numbers,
  }) {
    final $result = create();
    if (numbers != null) {
      $result.numbers.addAll(numbers);
    }
    return $result;
  }
  NumberArray._() : super();
  factory NumberArray.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NumberArray.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NumberArray', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'numbers', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NumberArray clone() => NumberArray()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NumberArray copyWith(void Function(NumberArray) updates) => super.copyWith((message) => updates(message as NumberArray)) as NumberArray;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NumberArray create() => NumberArray._();
  NumberArray createEmptyInstance() => create();
  static $pb.PbList<NumberArray> createRepeated() => $pb.PbList<NumberArray>();
  @$core.pragma('dart2js:noInline')
  static NumberArray getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NumberArray>(create);
  static NumberArray? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get numbers => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
