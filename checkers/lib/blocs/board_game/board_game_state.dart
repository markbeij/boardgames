import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'board_game_state.g.dart';

abstract class BoardGameState implements Built<BoardGameState, BoardGameStateBuilder> {
  // Fields
  BuiltList<Field> get fields;
  BuiltList<Player> get players;
  Player? get activePlayer;

  BoardGameState._();

  factory BoardGameState([void Function(BoardGameStateBuilder) updates]) = _$BoardGameState;

  String toJson() {
    return json.encode(serializers.serializeWith(BoardGameState.serializer, this));
  }

  static BoardGameState fromJson(String jsonString) {
    return serializers.deserializeWith(BoardGameState.serializer, json.decode(jsonString))!;
  }

  static Serializer<BoardGameState> get serializer => _$boardGameStateSerializer;
}

abstract class Field implements Built<Field, FieldBuilder> {
  // Fields
  Disk? get disk;
  BuiltList<Item<Object>> get items;

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

abstract class Item<T> implements Built<Item<T>, ItemBuilder<T>> {
  // Fields
  Player? get player;

  Item._();

  // factory Item([void Function(Item<T> Builder) updates]) = _$Item;
  factory Item([void Function(ItemBuilder<T>)? updates]) = _$Item<T>;

  String toJson() {
    return json.encode(serializers.serializeWith(Item.serializer, this));
  }

  static Item fromJson(String jsonString) {
    return serializers.deserializeWith(Item.serializer, json.decode(jsonString))!;
  }

  static Serializer<Item> get serializer => _$itemSerializer;
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
