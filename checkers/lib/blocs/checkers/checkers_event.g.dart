// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkers_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResetCheckersBoardEvent> _$resetCheckersBoardEventSerializer =
    new _$ResetCheckersBoardEventSerializer();

class _$ResetCheckersBoardEventSerializer
    implements StructuredSerializer<ResetCheckersBoardEvent> {
  @override
  final Iterable<Type> types = const [
    ResetCheckersBoardEvent,
    _$ResetCheckersBoardEvent
  ];
  @override
  final String wireName = 'ResetCheckersBoardEvent';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResetCheckersBoardEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  ResetCheckersBoardEvent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ResetCheckersBoardEventBuilder().build();
  }
}

class _$ResetCheckersBoardEvent extends ResetCheckersBoardEvent {
  factory _$ResetCheckersBoardEvent(
          [void Function(ResetCheckersBoardEventBuilder)? updates]) =>
      (new ResetCheckersBoardEventBuilder()..update(updates)).build();

  _$ResetCheckersBoardEvent._() : super._();

  @override
  ResetCheckersBoardEvent rebuild(
          void Function(ResetCheckersBoardEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetCheckersBoardEventBuilder toBuilder() =>
      new ResetCheckersBoardEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetCheckersBoardEvent;
  }

  @override
  int get hashCode {
    return 725409648;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ResetCheckersBoardEvent').toString();
  }
}

class ResetCheckersBoardEventBuilder
    implements
        Builder<ResetCheckersBoardEvent, ResetCheckersBoardEventBuilder> {
  _$ResetCheckersBoardEvent? _$v;

  ResetCheckersBoardEventBuilder();

  @override
  void replace(ResetCheckersBoardEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResetCheckersBoardEvent;
  }

  @override
  void update(void Function(ResetCheckersBoardEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetCheckersBoardEvent build() {
    final _$result = _$v ?? new _$ResetCheckersBoardEvent._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
