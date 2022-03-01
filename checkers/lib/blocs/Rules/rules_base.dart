import 'package:built_collection/built_collection.dart';
import 'package:checkers/blocs/checkers/checkers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RulesBaseHelper {
  static CheckersBoardStateBuilder createInitialStateBase(RulesBase rules) {
    final initialState = CheckersBoardStateBuilder();

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

  static void addDisks(CheckersBoardStateBuilder state, int from, int till, PlayerBuilder player) {
    for (var i = from; i < till; i++) {
      var ii = i ~/ 10 % 2 == 1;
      if (ii && i.isOdd || !ii && i.isEven) continue;

      final field = state.fields[i].toBuilder();

      final disk = DiskBuilder();
      disk.player = player;
      field.disk = disk;

      state.fields[i] = field.build();
    }
  }
}

abstract class RulesBase {
  int get initialBoardSize;
  int get initialPlayerCount;

  move(MoveEvent event, Emitter<CheckersBoardState> emit);
  CheckersBoardState createInitialState();
}
