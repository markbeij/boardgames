import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'board_game_state.g.dart';

abstract class BoardGameState {}

abstract class FinishedState implements BoardGameState, Built<FinishedState, FinishedStateBuilder> {
  // Fields
  Player? get playerWon;

  FinishedState._();

  factory FinishedState([void Function(FinishedStateBuilder) updates]) = _$FinishedState;

  String toJson() {
    return json.encode(serializers.serializeWith(FinishedState.serializer, this));
  }

  static FinishedState fromJson(String jsonString) {
    return serializers.deserializeWith(FinishedState.serializer, json.decode(jsonString))!;
  }

  static Serializer<FinishedState> get serializer => _$finishedStateSerializer;
}

abstract class PlayingState implements BoardGameState, Built<PlayingState, PlayingStateBuilder> {
  // Fields
  BuiltList<Field> get fields;
  BuiltList<Player> get players;
  Player? get activePlayer;

  PlayingState._();

  factory PlayingState([void Function(PlayingStateBuilder) updates]) = _$PlayingState;

  String toJson() {
    return json.encode(serializers.serializeWith(PlayingState.serializer, this));
  }

  static PlayingState fromJson(String jsonString) {
    return serializers.deserializeWith(PlayingState.serializer, json.decode(jsonString))!;
  }

  static Serializer<PlayingState> get serializer => _$playingStateSerializer;
}

abstract class Field implements Built<Field, FieldBuilder> {
  // Fields
  BuiltList<Object> get items;

  Field._();

  factory Field([void Function(FieldBuilder) updates]) = _$Field;

  String toJson() {
    return json.encode(serializers.serializeWith(Field.serializer, this));
  }

  static Field fromJson(String jsonString) {
    return serializers.deserializeWith(Field.serializer, json.decode(jsonString))!;
  }

  static Serializer<Field> get serializer => _$fieldSerializer;
}

abstract class Disk implements Built<Disk, DiskBuilder> {
  // Fields
  Player get player;
  bool get isKing;

  Disk._();

  factory Disk([void Function(DiskBuilder) updates]) = _$Disk;

  String toJson() {
    return json.encode(serializers.serializeWith(Disk.serializer, this));
  }

  static Disk fromJson(String jsonString) {
    return serializers.deserializeWith(Disk.serializer, json.decode(jsonString))!;
  }

  static Serializer<Disk> get serializer => _$diskSerializer;

  //Set default values
  static void _initializeBuilder(DiskBuilder builder) => builder..isKing = false;
}

abstract class Player implements Built<Player, PlayerBuilder> {
  // Fields
  String get name;

  Player._();

  factory Player([void Function(PlayerBuilder) updates]) = _$Player;

  String toJson() {
    return json.encode(serializers.serializeWith(Player.serializer, this));
  }

  static Player fromJson(String jsonString) {
    return serializers.deserializeWith(Player.serializer, json.decode(jsonString))!;
  }

  static Serializer<Player> get serializer => _$playerSerializer;
}
