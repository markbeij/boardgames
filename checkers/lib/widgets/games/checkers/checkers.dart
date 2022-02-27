import 'dart:math';

import 'package:checkers/blocs/checkers/checkers.dart';
import 'package:checkers/widgets/games/checkers/disk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckersWidget extends StatelessWidget {
  const CheckersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckersBoardBloc>(
      create: (context) => CheckersBlocFactory.createClassicCheckersGameBloc(),
      child: BlocBuilder<CheckersBoardBloc, CheckersBoardState>(builder: (context, state) {
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
                return AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: color,
                      alignment: Alignment.center,
                      child: Stack(children: [
                        if (state.fields[index].disk != null)
                          DiskWidget(
                            color: state.fields[index].disk!.player.name == 'Player_1' ? Colors.green : Colors.blue,
                          ),
                        Text(index.toString()),
                      ]),
                    ));
              }));
            }),
          ),
          InkWell(
            child: const Text('Move'),
            onTap: () {
              BlocProvider.of<CheckersBoardBloc>(context).add(MoveEvent((b) => b..hops = [38, 49]));
            },
          ),
          InkWell(
            child: const Text('Reset'),
            onTap: () {
              BlocProvider.of<CheckersBoardBloc>(context).add(ResetCheckersBoardEvent());
            },
          ),
          Text(
            "It's ${state.activePlayer.name}'s turn",
            style: TextStyle(color: state.activePlayer.name == 'Player_1' ? Colors.green : Colors.blue),
          ),
        ]);
      }),
    );
  }
}
