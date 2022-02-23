import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/serializers.dart';

part 'checkers_event.g.dart';

abstract class CheckersBoardEvent {}

abstract class ResetCheckersBoardEvent implements CheckersBoardEvent, Built<ResetCheckersBoardEvent, ResetCheckersBoardEventBuilder> {
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
