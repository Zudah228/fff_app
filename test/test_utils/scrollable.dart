import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

const findScrollableState = ScrollableStateFinders._();

class ScrollableStateFinders {
  const ScrollableStateFinders._();

  ScrollableState? heuristic() {
    return find
        .byType(Scrollable)
        .evaluate()
        .map<ScrollableState?>((Element element) {
          if (element is! StatefulElement) {
            return null;
          }

          final state = element.state;
          if (state is! ScrollableState) {
            return null;
          }

          final position = state.position;
          if (position.axisDirection != AxisDirection.down) {
            return null;
          }

          // Skip the scrollable if it is child of an EditableText.
          bool hasFoundEditableTextInAncestors = false;
          element.visitAncestorElements((ancestor) {
            if (ancestor.widget is EditableText) {
              hasFoundEditableTextInAncestors = true;
              return false;
            }

            return true;
          });

          if (hasFoundEditableTextInAncestors) {
            return null;
          }

          return state;
        })
        // lastWhere is used to get the desired scrollable.
        // (e.g. The center of TabView or PageView. Dialogs at the front.)
        .lastWhere(
          (ScrollableState? state) => state != null,
          orElse: () => null,
        );
  }

  ScrollableState? firstDescendant(FinderBase<Element> of) {
    return find
        .descendant(of: of, matching: find.byType(Scrollable))
        .evaluate()
        .map<ScrollableState?>((Element element) {
          if (element is! StatefulElement) {
            return null;
          }

          final state = element.state;
          if (state is! ScrollableState) {
            return null;
          }

          return state;
        })
        .firstWhere(
          (ScrollableState? state) => state != null,
          orElse: () => null,
        );
  }
}

@visibleForTesting
Future<void> scrollEverythingOutsideTheViewport(
  WidgetTester tester,
  ScrollableState scrollable, {
  int loopCount = 10,
}) async {
  var currentExtentTotal = scrollable.position.extentTotal;

  _scrollToMaxScrollExtent(scrollable);

  await tester.pump();

  // 末端までスクロール -> スクロール範囲が更新されたら再度スクロール
  // を、全てを描画はするまでスクロールを繰り返す。
  var count = 0;
  while (currentExtentTotal != scrollable.position.extentTotal &&
      count < loopCount) {
    currentExtentTotal = scrollable.position.extentTotal;

    _scrollToMaxScrollExtent(scrollable);

    await tester.pump();

    count++;
  }
}

void _scrollToMaxScrollExtent(
  ScrollableState scrollable,
) {
  scrollable.position.jumpTo(scrollable.position.maxScrollExtent);
}
