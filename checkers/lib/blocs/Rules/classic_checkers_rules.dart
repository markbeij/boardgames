import 'dart:math';

import 'package:checkers/blocs/Rules/rules_base.dart';
import 'package:checkers/blocs/board_game/board_game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassicRules implements RulesBase {
  final int _initialBoardSize;
  final int _initialPlayerCount = 2;

  const ClassicRules(this._initialBoardSize);

  @override
  int get initialBoardSize => _initialBoardSize;

  @override
  int get initialPlayerCount => _initialPlayerCount;

  @override
  move(MoveEvent event, Emitter<BoardGameState> emit) {
    // TODO: implement move
    throw UnimplementedError();
  }

  @override
  BoardGameState createInitialState() {
    final initialState = RulesBaseHelper.createInitialStateBase(this);

    final p1 = initialState.players[0].toBuilder();
    final p2 = initialState.players[1].toBuilder();

    final diskPerPlayer = (((sqrt(initialBoardSize).toInt() / 2) - 1) * sqrt(initialBoardSize).toInt()).toInt();

    //Put disks on the fields for player one
    RulesBaseHelper.addDisks(initialState, 0, diskPerPlayer, p1);
    //Put disks on the fields for player two
    RulesBaseHelper.addDisks(initialState, initialBoardSize - diskPerPlayer, initialBoardSize, p2);

    return initialState.build();
  }
}
