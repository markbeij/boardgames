import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'blocs/checkers/checkers.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  CheckersBoardEvent,
  CheckersBoardState,
  Disk,
  Player,
])
final Serializers serializers = _$serializers;
