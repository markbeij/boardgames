import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'checkers_state.g.dart';

abstract class CheckersBoardState implements Built<CheckersBoardState, CheckersBoardStateBuilder> {
  // Fields
  BuiltList<Field> get fields;
  BuiltList<Player> get players;
  Player? get activePlayer;

  CheckersBoardState._();

  factory CheckersBoardState([void Function(CheckersBoardStateBuilder) updates]) = _$CheckersBoardState;

  String toJson() {
    return json.encode(serializers.serializeWith(CheckersBoardState.serializer, this));
  }

  static CheckersBoardState fromJson(String jsonString) {
    return serializers.deserializeWith(CheckersBoardState.serializer, json.decode(jsonString))!;
  }

  static Serializer<CheckersBoardState> get serializer => _$checkersBoardStateSerializer;
}

abstract class Field implements Built<Field, FieldBuilder> {
  // Fields
  Disk? get disk;

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
