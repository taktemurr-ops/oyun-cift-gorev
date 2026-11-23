import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cift_gorev/oyun_cift_gorev.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ciftGorevConfig.title.length, 33);
    expect(ciftGorevConfig.tagline.length, 33);
    for (final s in ciftGorevConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ciftGorevConfig.gameId, ciftGorevId);
    expect(ciftGorevRules.gameId, ciftGorevId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ciftGorevRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ciftGorevId, optionalMechanics: ciftGorevRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ciftGorevRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
