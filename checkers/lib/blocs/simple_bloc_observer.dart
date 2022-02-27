import 'dart:developer';

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) async {
    log('onEvent for BLoC: ${bloc.runtimeType}. event: $event (${event.runtimeType})');

    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) async {
    log('onTransition for BLoC: ${bloc.runtimeType}. from currentState: ${transition.currentState.runtimeType} to ${transition.nextState.runtimeType} by ${transition.event.runtimeType}');

    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(error.toString());

    super.onError(bloc, error, stackTrace);
  }
}
