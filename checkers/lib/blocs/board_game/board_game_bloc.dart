import 'package:checkers/blocs/rules/rules_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_game.dart';

class BoardGameBloc extends Bloc<BoardGameEvent, BoardGameState> {
  final PlayingState _initialState;
  BoardGameBloc(RulesBase rules, this._initialState) : super(_initialState) {
    on<ResetCheckersBoardEvent>((event, emit) {
      emit(_initialState);
    });
    on<MoveEvent>((event, emit) {
      if (state is PlayingState) {
        rules.move(event, emit, state as PlayingState);
      }
    });
  }
}
