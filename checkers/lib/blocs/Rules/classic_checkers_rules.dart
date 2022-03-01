import 'package:checkers/blocs/Rules/rules_base.dart';
import 'package:checkers/blocs/checkers/checkers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassicRules implements RulesBase {
  const ClassicRules();

  @override
  int get initialBoardSize => 100;

  @override
  int get initialPlayerCount => 2;

  @override
  move(MoveEvent event, Emitter<CheckersBoardState> emit) {
    // TODO: implement move
    throw UnimplementedError();
  }

  @override
  CheckersBoardState createInitialState() {
    final initialState = RulesBaseHelper.createInitialStateBase(this);

    final p1 = initialState.players[0].toBuilder();
    final p2 = initialState.players[1].toBuilder();

    //Put disks on the fields for player one
    RulesBaseHelper.addDisks(initialState, 0, 40, p1);
    //Put disks on the fields for player two
    RulesBaseHelper.addDisks(initialState, initialBoardSize - 40, initialBoardSize, p2);

    return initialState.build();
  }
}
