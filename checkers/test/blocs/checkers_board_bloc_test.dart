import 'package:bloc_test/bloc_test.dart';
import 'package:checkers/blocs/Rules/classic_checkers_rules.dart';
import 'package:checkers/blocs/board_game/board_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CheckersBoardBloc', () {
    test('equality test Disk', () {
      final val1 = Disk((b) => b..player = (PlayerBuilder()..name = 'henk'));
      final val2 = Disk((d) => d..player = (PlayerBuilder()..name = 'henk'));

      expect(val1, val2);
    });

    test('equality test CheckersBoardState', () {
      final val1 = BoardGameState((b) => b);
      final val2 = BoardGameState((b) => b);

      expect(val1, val2);
    });

    blocTest(
      'emits [] when nothing is added',
      build: () {
        final rules = ClassicRules(100);
        return BoardGameBloc(rules, rules.createInitialState());
      },
      expect: () => [],
    );

    blocTest(
      'emits [1] when ResetCheckersBoardEvent is added',
      build: () {
        final rules = ClassicRules(100);
        return BoardGameBloc(rules, rules.createInitialState());
      },
      act: (BoardGameBloc bloc) => bloc.add(ResetCheckersBoardEvent()),
      expect: () => [ClassicRules(100).createInitialState()],
    );
  });
}
