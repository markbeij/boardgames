// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_game_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FinishedState> _$finishedStateSerializer =
    new _$FinishedStateSerializer();
Serializer<PlayingState> _$playingStateSerializer =
    new _$PlayingStateSerializer();
Serializer<Field> _$fieldSerializer = new _$FieldSerializer();
Serializer<Disk> _$diskSerializer = new _$DiskSerializer();
Serializer<Player> _$playerSerializer = new _$PlayerSerializer();

class _$FinishedStateSerializer implements StructuredSerializer<FinishedState> {
  @override
  final Iterable<Type> types = const [FinishedState, _$FinishedState];
  @override
  final String wireName = 'FinishedState';

  @override
  Iterable<Object?> serialize(Serializers serializers, FinishedState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.playerWon;
    if (value != null) {
      result
        ..add('playerWon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Player)));
    }
    return result;
  }

  @override
  FinishedState deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FinishedStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'playerWon':
          result.playerWon.replace(serializers.deserialize(value,
              specifiedType: const FullType(Player))! as Player);
          break;
      }
    }

    return result.build();
  }
}

class _$PlayingStateSerializer implements StructuredSerializer<PlayingState> {
  @override
  final Iterable<Type> types = const [PlayingState, _$PlayingState];
  @override
  final String wireName = 'PlayingState';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlayingState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fields',
      serializers.serialize(object.fields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Field)])),
      'players',
      serializers.serialize(object.players,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Player)])),
    ];
    Object? value;
    value = object.activePlayer;
    if (value != null) {
      result
        ..add('activePlayer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Player)));
    }
    return result;
  }

  @override
  PlayingState deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayingStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Field)]))!
              as BuiltList<Object?>);
          break;
        case 'players':
          result.players.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Player)]))!
              as BuiltList<Object?>);
          break;
        case 'activePlayer':
          result.activePlayer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Player))! as Player);
          break;
      }
    }

    return result.build();
  }
}

class _$FieldSerializer implements StructuredSerializer<Field> {
  @override
  final Iterable<Type> types = const [Field, _$Field];
  @override
  final String wireName = 'Field';

  @override
  Iterable<Object?> serialize(Serializers serializers, Field object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Object)])),
    ];

    return result;
  }

  @override
  Field deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Object)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DiskSerializer implements StructuredSerializer<Disk> {
  @override
  final Iterable<Type> types = const [Disk, _$Disk];
  @override
  final String wireName = 'Disk';

  @override
  Iterable<Object?> serialize(Serializers serializers, Disk object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'player',
      serializers.serialize(object.player,
          specifiedType: const FullType(Player)),
      'isKing',
      serializers.serialize(object.isKing, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Disk deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiskBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'player':
          result.player.replace(serializers.deserialize(value,
              specifiedType: const FullType(Player))! as Player);
          break;
        case 'isKing':
          result.isKing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PlayerSerializer implements StructuredSerializer<Player> {
  @override
  final Iterable<Type> types = const [Player, _$Player];
  @override
  final String wireName = 'Player';

  @override
  Iterable<Object?> serialize(Serializers serializers, Player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Player deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FinishedState extends FinishedState {
  @override
  final Player? playerWon;

  factory _$FinishedState([void Function(FinishedStateBuilder)? updates]) =>
      (new FinishedStateBuilder()..update(updates)).build();

  _$FinishedState._({this.playerWon}) : super._();

  @override
  FinishedState rebuild(void Function(FinishedStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FinishedStateBuilder toBuilder() => new FinishedStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinishedState && playerWon == other.playerWon;
  }

  @override
  int get hashCode {
    return $jf($jc(0, playerWon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FinishedState')
          ..add('playerWon', playerWon))
        .toString();
  }
}

class FinishedStateBuilder
    implements Builder<FinishedState, FinishedStateBuilder> {
  _$FinishedState? _$v;

  PlayerBuilder? _playerWon;
  PlayerBuilder get playerWon => _$this._playerWon ??= new PlayerBuilder();
  set playerWon(PlayerBuilder? playerWon) => _$this._playerWon = playerWon;

  FinishedStateBuilder();

  FinishedStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _playerWon = $v.playerWon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FinishedState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FinishedState;
  }

  @override
  void update(void Function(FinishedStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FinishedState build() {
    _$FinishedState _$result;
    try {
      _$result = _$v ?? new _$FinishedState._(playerWon: _playerWon?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'playerWon';
        _playerWon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FinishedState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PlayingState extends PlayingState {
  @override
  final BuiltList<Field> fields;
  @override
  final BuiltList<Player> players;
  @override
  final Player? activePlayer;

  factory _$PlayingState([void Function(PlayingStateBuilder)? updates]) =>
      (new PlayingStateBuilder()..update(updates)).build();

  _$PlayingState._(
      {required this.fields, required this.players, this.activePlayer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(fields, 'PlayingState', 'fields');
    BuiltValueNullFieldError.checkNotNull(players, 'PlayingState', 'players');
  }

  @override
  PlayingState rebuild(void Function(PlayingStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayingStateBuilder toBuilder() => new PlayingStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayingState &&
        fields == other.fields &&
        players == other.players &&
        activePlayer == other.activePlayer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, fields.hashCode), players.hashCode), activePlayer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlayingState')
          ..add('fields', fields)
          ..add('players', players)
          ..add('activePlayer', activePlayer))
        .toString();
  }
}

class PlayingStateBuilder
    implements Builder<PlayingState, PlayingStateBuilder> {
  _$PlayingState? _$v;

  ListBuilder<Field>? _fields;
  ListBuilder<Field> get fields => _$this._fields ??= new ListBuilder<Field>();
  set fields(ListBuilder<Field>? fields) => _$this._fields = fields;

  ListBuilder<Player>? _players;
  ListBuilder<Player> get players =>
      _$this._players ??= new ListBuilder<Player>();
  set players(ListBuilder<Player>? players) => _$this._players = players;

  PlayerBuilder? _activePlayer;
  PlayerBuilder get activePlayer =>
      _$this._activePlayer ??= new PlayerBuilder();
  set activePlayer(PlayerBuilder? activePlayer) =>
      _$this._activePlayer = activePlayer;

  PlayingStateBuilder();

  PlayingStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fields = $v.fields.toBuilder();
      _players = $v.players.toBuilder();
      _activePlayer = $v.activePlayer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayingState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlayingState;
  }

  @override
  void update(void Function(PlayingStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlayingState build() {
    _$PlayingState _$result;
    try {
      _$result = _$v ??
          new _$PlayingState._(
              fields: fields.build(),
              players: players.build(),
              activePlayer: _activePlayer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'players';
        players.build();
        _$failedField = 'activePlayer';
        _activePlayer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PlayingState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Field extends Field {
  @override
  final BuiltList<Object> items;

  factory _$Field([void Function(FieldBuilder)? updates]) =>
      (new FieldBuilder()..update(updates)).build();

  _$Field._({required this.items}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, 'Field', 'items');
  }

  @override
  Field rebuild(void Function(FieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FieldBuilder toBuilder() => new FieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Field && items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Field')..add('items', items))
        .toString();
  }
}

class FieldBuilder implements Builder<Field, FieldBuilder> {
  _$Field? _$v;

  ListBuilder<Object>? _items;
  ListBuilder<Object> get items => _$this._items ??= new ListBuilder<Object>();
  set items(ListBuilder<Object>? items) => _$this._items = items;

  FieldBuilder();

  FieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Field other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Field;
  }

  @override
  void update(void Function(FieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Field build() {
    _$Field _$result;
    try {
      _$result = _$v ?? new _$Field._(items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Field', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Disk extends Disk {
  @override
  final Player player;
  @override
  final bool isKing;

  factory _$Disk([void Function(DiskBuilder)? updates]) =>
      (new DiskBuilder()..update(updates)).build();

  _$Disk._({required this.player, required this.isKing}) : super._() {
    BuiltValueNullFieldError.checkNotNull(player, 'Disk', 'player');
    BuiltValueNullFieldError.checkNotNull(isKing, 'Disk', 'isKing');
  }

  @override
  Disk rebuild(void Function(DiskBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiskBuilder toBuilder() => new DiskBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Disk && player == other.player && isKing == other.isKing;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, player.hashCode), isKing.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Disk')
          ..add('player', player)
          ..add('isKing', isKing))
        .toString();
  }
}

class DiskBuilder implements Builder<Disk, DiskBuilder> {
  _$Disk? _$v;

  PlayerBuilder? _player;
  PlayerBuilder get player => _$this._player ??= new PlayerBuilder();
  set player(PlayerBuilder? player) => _$this._player = player;

  bool? _isKing;
  bool? get isKing => _$this._isKing;
  set isKing(bool? isKing) => _$this._isKing = isKing;

  DiskBuilder() {
    Disk._initializeBuilder(this);
  }

  DiskBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _player = $v.player.toBuilder();
      _isKing = $v.isKing;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Disk other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Disk;
  }

  @override
  void update(void Function(DiskBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Disk build() {
    _$Disk _$result;
    try {
      _$result = _$v ??
          new _$Disk._(
              player: player.build(),
              isKing: BuiltValueNullFieldError.checkNotNull(
                  isKing, 'Disk', 'isKing'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Disk', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Player extends Player {
  @override
  final String name;

  factory _$Player([void Function(PlayerBuilder)? updates]) =>
      (new PlayerBuilder()..update(updates)).build();

  _$Player._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Player', 'name');
  }

  @override
  Player rebuild(void Function(PlayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerBuilder toBuilder() => new PlayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Player && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Player')..add('name', name))
        .toString();
  }
}

class PlayerBuilder implements Builder<Player, PlayerBuilder> {
  _$Player? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PlayerBuilder();

  PlayerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Player;
  }

  @override
  void update(void Function(PlayerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Player build() {
    final _$result = _$v ??
        new _$Player._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Player', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
