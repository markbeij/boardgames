import 'package:checkers/blocs/Rules/rules_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_game.dart';

class BoardGameBloc extends Bloc<BoardGameEvent, BoardGameState> {
  final BoardGameState _initialState;
  BoardGameBloc(RulesBase rules, this._initialState) : super(_initialState) {
    on<ResetCheckersBoardEvent>((event, emit) {
      emit(_initialState);
    });
    on<MoveEvent>((event, emit) {
      rules.move(event, emit, state);
    });
  }
}
