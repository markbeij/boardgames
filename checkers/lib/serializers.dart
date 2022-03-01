import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:checkers/blocs/board_game/board_game.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  BoardGameEvent,
  BoardGameState,
  Disk,
  Player,
])
final Serializers serializers = _$serializers;
