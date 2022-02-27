import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';

part 'move_event.g.dart';

abstract class MoveBlocEvent {}

class ResetHopsEvent implements MoveBlocEvent {}

abstract class AddHopEvent implements MoveBlocEvent, Built<AddHopEvent, AddHopEventBuilder> {
  // Fields
  int get hop;

  AddHopEvent._();

  factory AddHopEvent([void Function(AddHopEventBuilder)? updates]) = _$AddHopEvent;

  String toJson() {
    return json.encode(serializers.serializeWith(AddHopEvent.serializer, this));
  }

  static AddHopEvent fromJson(String jsonString) {
    return serializers.deserializeWith(AddHopEvent.serializer, json.decode(jsonString))!;
  }

  static Serializer<AddHopEvent> get serializer => _$addHopEventSerializer;
}
