import 'package:checkers/blocs/move/move.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoveBloc extends Bloc<MoveBlocEvent, MoveState> {
  MoveBloc(MoveState initialState) : super(initialState) {
    on<ResetHopsEvent>((event, emit) {
      emit(MoveState());
    });
    on<AddHopEvent>((event, emit) {
      emit(state.rebuild((state) => state.hops.add(event.hop)));
    });
  }
}
