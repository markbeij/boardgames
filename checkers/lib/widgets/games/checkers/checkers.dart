import 'dart:math';

import 'package:checkers/blocs/Rules/classic_checkers_rules.dart';
import 'package:checkers/blocs/checkers/checkers.dart';
import 'package:checkers/blocs/move/move.dart';
import 'package:checkers/widgets/games/checkers/disk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckersWidget extends StatelessWidget {
  const CheckersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CheckersBoardBloc>(create: (context) => CheckersBoardBloc(const ClassicRules())),
        BlocProvider<MoveBloc>(create: (context) => MoveBloc(MoveState())),
      ],
      child: Column(children: [
        BlocBuilder<CheckersBoardBloc, CheckersBoardState>(builder: (context, state) {
          final dimensions = sqrt(state.fields.length).toInt();
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Table(
              border: const TableBorder(
                horizontalInside: BorderSide(),
                verticalInside: BorderSide(),
              ),
              children: List.generate(dimensions, (y) {
                return TableRow(
                    children: List.generate(dimensions, (x) {
                  final index = (y * dimensions) + x;
                  Color color;
                  if (index % 2 == 0) {
                    color = y % 2 == 0 ? Colors.amber : Colors.blueGrey;
                  } else {
                    color = y % 2 == 0 ? Colors.blueGrey : Colors.amber;
                  }
                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<MoveBloc>(context).add(AddHopEvent((b) => b.hop = index));
                      },
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: color,
                            alignment: Alignment.center,
                            child: Stack(children: [
                              if (state.fields[index].disk != null)
                                DiskWidget(
                                  color: state.fields[index].disk!.player.name == 'Player_1' ? Colors.green : Colors.blue,
                                  onTap: () {
                                    BlocProvider.of<MoveBloc>(context).add(ResetHopsEvent());
                                    BlocProvider.of<MoveBloc>(context).add(AddHopEvent((b) => b.hop = index));
                                  },
                                ),
                              Text(index.toString()),
                            ]),
                          )));
                }));
              }),
            ),
            InkWell(
              child: const Text('Move'),
              onTap: () {
                final moveState = BlocProvider.of<MoveBloc>(context).state;
                BlocProvider.of<CheckersBoardBloc>(context).add(MoveEvent((b) => b..hops.addAll(moveState.hops)));
              },
            ),
            InkWell(
              child: const Text('Reset'),
              onTap: () {
                BlocProvider.of<CheckersBoardBloc>(context).add(ResetCheckersBoardEvent());
              },
            ),
            Text(
              "It's ${state.activePlayer?.name}'s turn",
              style: TextStyle(color: state.activePlayer?.name == 'Player_1' ? Colors.green : Colors.blue),
            ),
          ]);
        }),
        BlocBuilder<MoveBloc, MoveState>(builder: (context, state) {
          return Column(
            children: [
              const Text('-----'),
              const Text('MOVES'),
              Column(
                children: List.generate(state.hops.length, (index) => Text('$index - ${state.hops[index]}')),
              )
            ],
          );
        }),
      ]),
    );
  }
}
