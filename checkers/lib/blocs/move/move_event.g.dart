// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddHopEvent> _$addHopEventSerializer = new _$AddHopEventSerializer();

class _$AddHopEventSerializer implements StructuredSerializer<AddHopEvent> {
  @override
  final Iterable<Type> types = const [AddHopEvent, _$AddHopEvent];
  @override
  final String wireName = 'AddHopEvent';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddHopEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hop',
      serializers.serialize(object.hop, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  AddHopEvent deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddHopEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hop':
          result.hop = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AddHopEvent extends AddHopEvent {
  @override
  final int hop;

  factory _$AddHopEvent([void Function(AddHopEventBuilder)? updates]) =>
      (new AddHopEventBuilder()..update(updates)).build();

  _$AddHopEvent._({required this.hop}) : super._() {
    BuiltValueNullFieldError.checkNotNull(hop, 'AddHopEvent', 'hop');
  }

  @override
  AddHopEvent rebuild(void Function(AddHopEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddHopEventBuilder toBuilder() => new AddHopEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddHopEvent && hop == other.hop;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hop.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddHopEvent')..add('hop', hop))
        .toString();
  }
}

class AddHopEventBuilder implements Builder<AddHopEvent, AddHopEventBuilder> {
  _$AddHopEvent? _$v;

  int? _hop;
  int? get hop => _$this._hop;
  set hop(int? hop) => _$this._hop = hop;

  AddHopEventBuilder();

  AddHopEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hop = $v.hop;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddHopEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddHopEvent;
  }

  @override
  void update(void Function(AddHopEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddHopEvent build() {
    final _$result = _$v ??
        new _$AddHopEvent._(
            hop: BuiltValueNullFieldError.checkNotNull(
                hop, 'AddHopEvent', 'hop'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
