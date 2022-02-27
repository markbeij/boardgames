import 'package:built_collection/built_collection.dart';
import 'package:checkers/blocs/checkers/checkers.dart';

abstract class CheckerRules {
  int get initialBoardSize;
  int get initialPlayerCount;
}

class ClassicRules implements CheckerRules {
  const ClassicRules();

  @override
  int get initialBoardSize => 100;

  @override
  int get initialPlayerCount => 2;
}

class CheckersBlocFactory {
  static CheckersBoardStateBuilder _createInitialState(CheckerRules rules) {
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

  static CheckersBoardBloc createClassicCheckersGameBloc() {
    const rules = ClassicRules();

    final initialState = createClassicCheckersGameState(rules);

    return CheckersBoardBloc(rules, initialState);
  }

  static void _addDisks(CheckersBoardStateBuilder state, int from, int till, PlayerBuilder player) {
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

  static CheckersBoardState createClassicCheckersGameState(CheckerRules rules) {
    final initialState = _createInitialState(rules);

    final p1 = initialState.players[0].toBuilder();
    final p2 = initialState.players[1].toBuilder();

    //Put disks on the fields for player one
    _addDisks(initialState, 0, 40, p1);
    //Put disks on the fields for player two
    _addDisks(initialState, rules.initialBoardSize - 40, rules.initialBoardSize, p2);

    return initialState.build();
  }
}
