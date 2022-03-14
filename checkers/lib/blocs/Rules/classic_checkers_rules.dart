import 'dart:developer';
import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:checkers/blocs/rules/rules_base.dart';
import 'package:checkers/blocs/board_game/board_game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassicCheckersRules implements RulesBase {
  final int _initialBoardSize;
  final int _initialPlayerCount = 2;

  ClassicCheckersRules(this._initialBoardSize) {
    final d = math.sqrt(_initialBoardSize);
    if (d != d.roundToDouble()) {
      throw ArgumentError('The root of _initialBoardSize should be a round number', '_initialBoardSize');
    }
  }

  @override
  int get initialBoardSize => _initialBoardSize;

  @override
  int get initialPlayerCount => _initialPlayerCount;

  @override
  move(MoveEvent event, Emitter<BoardGameState> emit, PlayingState state) {
    if (event.hops.isEmpty) {
      log('No hops, so no state is changed');
      return;
    }
    if (event.hops.length == 1) {
      log('One hop is no hop, so no state is changed');
      return;
    }

    if (state.fields[event.hops.first].items.isEmpty) {
      log('No disk at first hop, so no state is changed');
      return;
    }

    final disk = state.fields[event.hops.first].items.first as Disk;

    if (disk.player != state.activePlayer) {
      log('Disk does not belong to active player. Disk belongs to ${disk.player.name} and active player is ${state.activePlayer?.name}');
      return;
    }

    if (!disk.isKing && event.hops.length != 2) {
      log('Disk is not a king, so only a single hop is allowed. No state is changed');
      return;
    }

    //validate hops
    for (var i = 1; i < event.hops.length; i++) {
      if (disk.isKing) {
        //TODO: Implement
      } else {
        //Check if field is already occupied
        if (state.fields[event.hops[i]].items.isNotEmpty) {
          log('Invalid move, field ${event.hops[i]} is occupied');
          return;
        }
        //Check if disk is moved one place diagonal forwards
        final rowLength = math.sqrt(state.fields.length);
        if (disk.player.name == 'Player_1') {
          if (event.hops[i] != event.hops[i - 1] + rowLength - 1 && event.hops[i] != event.hops[i - 1] + rowLength + 1) {
            log('Invalid move for Player_1 (from ${event.hops[i - 1]} to ${event.hops[i]})');
            return;
          }
        }
        if (disk.player.name == 'Player_2') {
          if (event.hops[i] != event.hops[i - 1] - rowLength + 1 && event.hops[i] != event.hops[i - 1] - rowLength - 1) {
            log('Invalid move for Player_2 (from ${event.hops[i - 1]} to ${event.hops[i]})');
            return;
          }
        }
      }

      //All checks are passed. Change the state
      final newState = state.rebuild((state) {
        //Change active player
        state.activePlayer = state.activePlayer.build() == state.players[0] ? state.players[1].toBuilder() : state.players[0].toBuilder();

        //Remove the disk at original field
        state.fields[event.hops.first] = state.fields[event.hops.first].rebuild((p0) => p0..items = ListBuilder());

        //Recreate disk at target field
        state.fields[event.hops.last] = state.fields[event.hops.last].rebuild((p0) => p0..items.add(disk));

        //TODO: Remove opponents disks

        return state;
      });

      emit(newState);
    }
  }

  @override
  PlayingState createInitialState() {
    final initialState = RulesBaseHelper.createInitialStateBase(this);

    final p1 = initialState.players[0].toBuilder();
    final p2 = initialState.players[1].toBuilder();

    final disksPerPlayer = (((math.sqrt(initialBoardSize).toInt() / 2) - 1) * math.sqrt(initialBoardSize).toInt()).toInt();

    //Put disks on the fields for player one
    RulesBaseHelper.addDisks(initialState, 0, disksPerPlayer, p1);
    //Put disks on the fields for player two
    RulesBaseHelper.addDisks(initialState, initialBoardSize - disksPerPlayer, initialBoardSize, p2);

    return initialState.build();
  }
}
