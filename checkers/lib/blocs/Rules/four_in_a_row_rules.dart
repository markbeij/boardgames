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
  PlayingState createInitialState() {
    final initialState = RulesBaseHelper.createInitialStateBase(this);

    return initialState.build();
  }

  @override
  int get initialBoardSize => _initialBoardSize;

  @override
  int get initialPlayerCount => _initialPlayerCount;

  @override
  move(MoveEvent event, Emitter<BoardGameState> emit, PlayingState state) {
    if (event.hops.isEmpty) {
      log('No hop');
      return;
    }

    if (state.fields[event.hops.last].items.isNotEmpty) {
      log('There is already a disk at this position');
      return;
    }

    final rowLength = math.sqrt(state.fields.length).toInt();
    if (event.hops.last < state.fields.length - rowLength) {
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

    //Check horizontal win
    var won = checkHorizontalWin(event.hops.last, state);

    if (won) {
      emit(FinishedState((b) => b.playerWon = state.activePlayer!.toBuilder()));
      return;
    }

    //Check for vertical win
    won = checkverticalWin(event.hops.last, state);

    if (won) {
      emit(FinishedState((b) => b.playerWon = state.activePlayer!.toBuilder()));
      return;
    }

    //Check for diagonal win
    won = checkDiagonalWin(event.hops.last, state);

    if (won) {
      emit(FinishedState((b) => b.playerWon = state.activePlayer!.toBuilder()));
      return;
    }

    //Check for stalemate
    if (!resultState.fields.any((p0) => p0.items.isEmpty)) {
      //emit stalemate
      emit(FinishedState());
    }
  }

  bool checkHorizontalWin(int hop, PlayingState state) {
    var count = 1;
    //Check items of same player on the left side of the current disk
    for (var i = 1; i < 4; i++) {
      if (hop - i < 0) break;
      if (state.fields[hop - i].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    //Check items of same player on the right side of the current disk
    for (var i = 1; i < 4; i++) {
      if (hop + i > state.fields.length - 1) break;
      if (state.fields[hop + i].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    return count >= 4;
  }

  bool checkverticalWin(int hop, PlayingState state) {
    var count = 1;
    final rowLength = math.sqrt(state.fields.length).toInt();

    //Check items of same player below the current disk
    for (var i = 1; i < 4; i++) {
      if (hop + (i * rowLength) > state.fields.length - 1) break;
      if (state.fields[hop + (i * rowLength)].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    return count >= 4;
  }

  bool checkDiagonalWin(int hop, PlayingState state) {
    var count = 1;
    final rowLength = math.sqrt(state.fields.length).toInt();

    //Check items to the top left side of the current disk
    for (var i = 1; i < 4; i++) {
      if (hop - i - (i * rowLength) < 0) break;
      if (state.fields[hop - i - (i * rowLength)].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    //Check items to the bottom right of the current disk
    for (var i = 1; i < 4; i++) {
      if (hop + i + (i * rowLength) > state.fields.length - 1) break;
      if (state.fields[hop + i + (i * rowLength)].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    if (count >= 4) return true;

    count = 1;

    //Check items to the top right side of the current disk
    for (var i = 1; i < 4; i++) {
      if (hop + i - (i * rowLength) < 0) break;
      if (state.fields[hop + i - (i * rowLength)].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    //Check items to the bottom left of the current disk
    for (var i = 1; i < 4; i++) {
      if (hop - i + (i * rowLength) > state.fields.length - 1) break;
      if (state.fields[hop - i + (i * rowLength)].items.any((p0) => p0 is Disk && p0.player == state.activePlayer)) {
        count++;
      } else {
        break;
      }
    }

    return count >= 4;
  }
}
