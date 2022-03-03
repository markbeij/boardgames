import 'dart:developer';
import 'dart:math' as math;

import 'package:checkers/blocs/Rules/rules_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_game.dart';

class BoardGameBloc extends Bloc<BoardGameEvent, BoardGameState> {
  BoardGameBloc(RulesBase rules) : super(rules.createInitialState()) {
    on<ResetCheckersBoardEvent>((event, emit) {
      emit(rules.createInitialState());
    });
    on<MoveEvent>((event, emit) {
      if (event.hops.isEmpty) {
        log('No hops, so no state is changed');
        return;
      }
      if (event.hops.length == 1) {
        log('One hop is no hop, so no state is changed');
        return;
      }

      final disk = state.fields[event.hops.first].disk;

      if (disk == null) {
        log('No disk at first hop, so no state is changed');
        return;
      }

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
          if (state.fields[event.hops[i]].disk != null) {
            log('Invalid move, field ${event.hops[i]} is occupied');
          }
          //Check if disk is moved one place diagonal forwards
          final rowLength = math.sqrt(state.fields.length);
          if (disk.player.name == 'Player_1') {
            if (event.hops[i] != event.hops[i - 1] + rowLength - 1 && event.hops[i] != event.hops[i - 1] + rowLength + 1) {
              log('Invalid move (from ${event.hops[i - 1]} to ${event.hops[i]})');
              return;
            }
          }
          if (disk.player.name == 'Player_2') {
            if (event.hops[i] != event.hops[i - 1] - 9 && event.hops[i] != event.hops[i - 1] - 11) {
              log('Invalid move (from ${event.hops[i - 1]} to ${event.hops[i]})');
              return;
            }
          }
        }

        //All checks are passed. Change the state
        final newState = state.rebuild((state) {
          //Change active player
          state.activePlayer = state.activePlayer.build() == state.players[0] ? state.players[1].toBuilder() : state.players[0].toBuilder();

          //Remove the disk at original field
          state.fields[event.hops.first] = state.fields[event.hops.first].rebuild((p0) => p0..disk = null);

          //Recreate disk at target field
          state.fields[event.hops.last] = state.fields[event.hops.last].rebuild((p0) => p0..disk = disk.toBuilder());

          //TODO: Remove opponents disks

          return state;
        });

        emit(newState);
      }
    });
  }
}
