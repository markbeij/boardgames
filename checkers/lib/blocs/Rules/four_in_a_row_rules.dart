import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:checkers/blocs/board_game/board_game_state.dart';

import 'package:checkers/blocs/board_game/board_game_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import './rules_base.dart';

class FourInARowRules implements RulesBase {
  final int _initialBoardSize;
  final int _initialPlayerCount = 2;

  FourInARowRules(this._initialBoardSize) {
    final d = math.sqrt(_initialBoardSize);
    if (d != d.roundToDouble()) {
      throw ArgumentError('The root of _initialBoardSize should be a round number', '_initialBoardSize');
    }
  }

  @override
  BoardGameState createInitialState() {
    final initialState = RulesBaseHelper.createInitialStateBase(this);

    return initialState.build();
  }

  @override
  int get initialBoardSize => _initialBoardSize;

  @override
  int get initialPlayerCount => _initialPlayerCount;

  @override
  move(MoveEvent event, Emitter<BoardGameState> emit, BoardGameState state) {
    if (event.hops.isEmpty) {
      log('No hop');
      return;
    }
    // if (event.hops.length != 1) {
    //   log('Only one hop is allowed');
    //   return;
    // }

    if (state.fields[event.hops.last].items.isNotEmpty) {
      log('There is already a disk at this position');
      return;
    }

    final rowLength = math.sqrt(state.fields.length).toInt();
    if (event.hops.last <= state.fields.length - rowLength) {
      if (state.fields[event.hops.last + rowLength].items.isEmpty) {
        log('Not on lowest row possible');
        return;
      }
    }

    final resultState = state.rebuild((p0) {
      //Change active player
      p0.activePlayer = p0.activePlayer.build() == state.players[0] ? state.players[1].toBuilder() : state.players[0].toBuilder();

      p0.fields[event.hops.last] = p0.fields[event.hops.last].rebuild((p0) {
        return p0.items = ListBuilder([
          Disk(
            (p0) {
              p0.isKing = false;
              p0.player = state.activePlayer!.toBuilder();
            },
          )
        ]);
      });
    });

    emit(resultState);

    //Check for win

    //Check for stalemate
    if (!resultState.fields.any((p0) => p0.items.isNotEmpty)) {
      //emit stale mate
    }
  }
}
