// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoveState> _$moveStateSerializer = new _$MoveStateSerializer();

class _$MoveStateSerializer implements StructuredSerializer<MoveState> {
  @override
  final Iterable<Type> types = const [MoveState, _$MoveState];
  @override
  final String wireName = 'MoveState';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoveState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hops',
      serializers.serialize(object.hops,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  MoveState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoveStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hops':
          result.hops.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$MoveState extends MoveState {
  @override
  final BuiltList<int> hops;

  factory _$MoveState([void Function(MoveStateBuilder)? updates]) =>
      (new MoveStateBuilder()..update(updates)).build();

  _$MoveState._({required this.hops}) : super._() {
    BuiltValueNullFieldError.checkNotNull(hops, 'MoveState', 'hops');
  }

  @override
  MoveState rebuild(void Function(MoveStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoveStateBuilder toBuilder() => new MoveStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoveState && hops == other.hops;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hops.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MoveState')..add('hops', hops))
        .toString();
  }
}

class MoveStateBuilder implements Builder<MoveState, MoveStateBuilder> {
  _$MoveState? _$v;

  ListBuilder<int>? _hops;
  ListBuilder<int> get hops => _$this._hops ??= new ListBuilder<int>();
  set hops(ListBuilder<int>? hops) => _$this._hops = hops;

  MoveStateBuilder();

  MoveStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hops = $v.hops.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoveState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoveState;
  }

  @override
  void update(void Function(MoveStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MoveState build() {
    _$MoveState _$result;
    try {
      _$result = _$v ?? new _$MoveState._(hops: hops.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hops';
        hops.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MoveState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
