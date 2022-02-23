import 'package:checkers/blocs/checkers/checkers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePageWidget extends StatelessWidget {
  final Widget? child;
  final String title;

  const GamePageWidget({Key? key, this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocProvider<CheckersBoardBloc>(
          create: (context) => CheckersBlocFactory.createClassicCheckersGame(),
          child: child,
        ),
      ),
    );
  }
}
