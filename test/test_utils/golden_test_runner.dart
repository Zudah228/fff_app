import 'package:change_case/change_case.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'scrollable.dart';
import 'tester_app.dart';
import 'tester_device.dart';

void testGolden(
  String name,
  Future<void> Function(GoldenTestRunner goldenTestRunner, WidgetTester tester)
  runGoldenTest, {
  TesterDevice device = const TesterDevice.iPhone14(),
  DateTime? fixedDateTime,
}) {
  testWidgets('$name Golden Test', (tester) async {
    return withClock(
      Clock.fixed(fixedDateTime ?? DateTime(2025)),
      () async {
        final goldenTestRunner = GoldenTestRunner(
          name: name,
          tester: tester,
          device: device,
        );
        await runGoldenTest(goldenTestRunner, tester);
      },
    );
  });
}

class GoldenTestRunner {
  GoldenTestRunner({
    required this.name,
    required this.tester,
    required this.device,
  });

  final String name;
  final WidgetTester tester;
  final TesterDevice device;

  Future<void> pumpWithWidgetsApp(Widget child) async {
    await tester.pumpWidget(
      TesterApp(
        child: child,
      ),
    );
  }

  Future<void> runGoldenTest({
    required String name,
    FinderBase<Element>? finder,
    ScrollableState? scrollableStateForAutoHeight,
    bool autoHeight = true,
  }) async {
    finder ??= find.byType(WidgetsApp);

    if (autoHeight) {
      final originalWindowSize = tester.view.physicalSize;
      final scrollable =
          scrollableStateForAutoHeight ?? findScrollableState.heuristic();

      final renderObject = tester.renderObject(finder);

      var finalHeight = originalWindowSize.height;
      if (scrollable != null && scrollable.position.extentAfter.isFinite) {
        finalHeight =
            originalWindowSize.height + scrollable.position.extentAfter;
      } else if (renderObject is RenderBox) {
        finalHeight = renderObject.size.height;
      }

      final adjustedSize = Size(originalWindowSize.width, finalHeight);
      await tester.binding.setSurfaceSize(adjustedSize);
      tester.view.physicalSize = adjustedSize;
    }

    final filename = _formatDirName(this.name) + name.toSnakeCase();
    await expectLater(
      finder,
      matchesGoldenFile(
        'goldens/$filename.png',
      ),
    );
    debugDisableShadows = true;
  }
}

String _formatDirName(String name) {
  return name
      .replaceAll(r' - ', ' ')
      .replaceAll(RegExp(r'-|(|)'), '')
      .replaceAll(r' ', '_')
      .toLowerCase();
}
