import 'package:built_collection/built_collection.dart';
import 'package:checkers/blocs/checkers/checkers.dart';

abstract class CheckerRules {
  int get initialBoardSize;
  int get initialPlayerCount;
}

class ClassicRules implements CheckerRules {
  const ClassicRules();

  @override
  int get initialBoardSize => 50;

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
      player.name = 'Player_$i';
      players.add(player.build());
    }

    initialState.players = players;

    //Create empty fields
    initialState.fields = ListBuilder(List.filled(rules.initialBoardSize, FieldBuilder().build()));

    return initialState;
  }

  static CheckersBoardBloc createClassicCheckersGame() {
    const rules = ClassicRules();
    final initialState = _createInitialState(rules);

    final p1 = initialState.players[0].toBuilder();
    final p2 = initialState.players[1].toBuilder();

    //Put disks on the fields for player one
    for (var i = 0; i < 20; i++) {
      final field = initialState.fields[i].toBuilder();

      final disk = DiskBuilder();
      disk.player = p1;
      field.disk = disk;

      initialState.fields[i] = field.build();
    }

    //Put disks on the fields for player two
    for (var i = 30; i < 50; i++) {
      final field = initialState.fields[i].toBuilder();

      final disk = DiskBuilder();
      disk.player = p2;
      field.disk = disk;

      initialState.fields[i] = field.build();
    }

    return CheckersBoardBloc(rules, initialState.build());
  }
}
