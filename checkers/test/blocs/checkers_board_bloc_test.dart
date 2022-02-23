import 'package:bloc_test/bloc_test.dart';
import 'package:checkers/blocs/checkers/checkers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CheckersBoardBloc', () {
    test('equality test Disk', () {
      final val1 = Disk((b) => b..player = (PlayerBuilder()..name = 'henk'));
      final val2 = Disk((d) => d..player = (PlayerBuilder()..name = 'henk'));

      expect(val1, val2);
    });

    test('equality test CheckersBoardState', () {
      final val1 = CheckersBoardState((b) => b);
      final val2 = CheckersBoardState((b) => b);

      expect(val1, val2);
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => CheckersBoardBloc(const ClassicRules(), CheckersBoardState((b) => b)),
      expect: () => [],
    );

    blocTest(
      'emits [1] when ResetCheckersBoardEvent is added',
      build: () => CheckersBoardBloc(const ClassicRules(), CheckersBoardState((b) => b)),
      act: (CheckersBoardBloc bloc) => bloc.add(ResetCheckersBoardEvent()),
      expect: () => [CheckersBoardState((b) => b)],
    );
  });
}
