import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:checkers/blocs/board_game/board_game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RulesBaseHelper {
  static PlayingStateBuilder createInitialStateBase(RulesBase rules) {
    final initialState = PlayingStateBuilder();

    //Create players
    final players = ListBuilder<Player>();

    for (var i = 0; i < rules.initialPlayerCount; i++) {
      final player = PlayerBuilder();
      player.name = 'Player_${i + 1}';
      players.add(player.build());
    }

    initialState.players = players;
    initialState.activePlayer = players[0].toBuilder();

    //Create empty fields
    initialState.fields = ListBuilder(List.filled(rules.initialBoardSize, FieldBuilder().build()));

    return initialState;
  }

  static void addDisks(PlayingStateBuilder state, int from, int till, PlayerBuilder player) {
    final rowLength = sqrt(state.fields.length).toInt();
    for (var i = from; i < till; i++) {
      var ii = i ~/ rowLength % 2 == 1;
      if (ii && i.isOdd || !ii && i.isEven) continue;

      final field = state.fields[i].toBuilder();

      final disk = DiskBuilder();
      disk.player = player;
      field.items.add(disk.build());

      state.fields[i] = field.build();
    }
  }
}

abstract class RulesBase {
  int get initialBoardSize;
  int get initialPlayerCount;

  move(MoveEvent event, Emitter<BoardGameState> emit, PlayingState state);
  PlayingState createInitialState();
}
