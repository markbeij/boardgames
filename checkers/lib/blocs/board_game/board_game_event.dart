import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';

part 'board_game_event.g.dart';

abstract class BoardGameEvent {}

abstract class MoveEvent implements BoardGameEvent, Built<MoveEvent, MoveEventBuilder> {
  // Fields
  BuiltList<int> get hops;

  MoveEvent._();

  factory MoveEvent([void Function(MoveEventBuilder) updates]) = _$MoveEvent;

  String toJson() {
    return json.encode(serializers.serializeWith(MoveEvent.serializer, this));
  }

  static MoveEvent fromJson(String jsonString) {
    return serializers.deserializeWith(MoveEvent.serializer, json.decode(jsonString))!;
  }

  static Serializer<MoveEvent> get serializer => _$moveEventSerializer;
}

abstract class ResetCheckersBoardEvent implements BoardGameEvent, Built<ResetCheckersBoardEvent, ResetCheckersBoardEventBuilder> {
  // Fields

  ResetCheckersBoardEvent._();

  factory ResetCheckersBoardEvent([void Function(ResetCheckersBoardEventBuilder) updates]) = _$ResetCheckersBoardEvent;

  String toJson() {
    return json.encode(serializers.serializeWith(ResetCheckersBoardEvent.serializer, this));
  }

  static ResetCheckersBoardEvent fromJson(String jsonString) {
    return serializers.deserializeWith(ResetCheckersBoardEvent.serializer, json.decode(jsonString))!;
  }

  static Serializer<ResetCheckersBoardEvent> get serializer => _$resetCheckersBoardEventSerializer;
}
