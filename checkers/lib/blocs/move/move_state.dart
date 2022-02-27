import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';

part 'move_state.g.dart';

abstract class MoveState implements Built<MoveState, MoveStateBuilder> {
  // Fields
  BuiltList<int> get hops;

  MoveState._();

  factory MoveState([void Function(MoveStateBuilder) updates]) = _$MoveState;

  String toJson() {
    return json.encode(serializers.serializeWith(MoveState.serializer, this));
  }

  static MoveState fromJson(String jsonString) {
    return serializers.deserializeWith(MoveState.serializer, json.decode(jsonString))!;
  }

  static Serializer<MoveState> get serializer => _$moveStateSerializer;
}
