import 'dart:developer';

import 'package:bloc/bloc.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// We can extend `BlocObserver` and override `onTransition` and `onError`
// in order to handle transitions and errors from all Blocs.
class SimpleBlocObserver extends BlocObserver {
  // @override
  // void onEvent(Bloc bloc, Object? event) async {
  //   await FirebaseCrashlytics.instance.log('Event send to bloc: ${bloc.runtimeType} to ${event.runtimeType}');
  //   super.onEvent(bloc, event);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) async {
    // await FirebaseCrashlytics.instance.log('State changed of bloc: ${bloc.runtimeType} to ${transition.nextState.runtimeType}');
    // print(transition);
    log(transition.toString());

    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // print(error);
    log(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
