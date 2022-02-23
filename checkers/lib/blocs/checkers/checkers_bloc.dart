import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkers.dart';

class CheckersBoardBloc extends Bloc<CheckersBoardEvent, CheckersBoardState> {
  CheckersBoardBloc(CheckerRules rules, CheckersBoardState initialState) : super(initialState) {
    on<CheckersBoardEvent>((event, emit) => emit(state));
    // on<CheckersBoardEvent>((event, emit) => emit(state));
  }
}
