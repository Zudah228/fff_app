import 'package:fff_app/core/app/components/button/primary_button.dart';
import 'package:fff_app/core/app/components/button/tertiary_button.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    this.title,
    required this.content,
    this.primaryAction,
    this.cancelAction,
    this.spaceBetweenTitleAndContent,
  });

  final Widget? title;
  final Widget? content;
  final double? spaceBetweenTitleAndContent;
  final CommonDialogAction? primaryAction;
  final CommonDialogAction? cancelAction;

  List<Widget> _getActions(BuildContext context) {
    const constraints = BoxConstraints(
      minWidth: 100,
      minHeight: 40,
    );
    return [
      if (cancelAction case final action?)
        ConstrainedBox(
          constraints: constraints,
          child: TertiaryButton(
            onPressed: action.onTap,
            child: Text(action.label),
          ),
        ),
      if (primaryAction case final action?)
        ConstrainedBox(
          constraints: constraints,
          child: PrimaryButton(
            onPressed: action.onTap,
            child: Text(action.label),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    const defaultPadding = EdgeInsets.symmetric(horizontal: 24);

    final effectiveContentPadding =
        EdgeInsets.only(
          top: content == null
              ? 0
              : spaceBetweenTitleAndContent ??
                    (themeData.useMaterial3 ? 16.0 : 20.0),

          bottom: 24,
        ) +
        defaultPadding;

    final actions = _getActions(context);
    final MainAxisAlignment actionsAlignment = MainAxisAlignment.end;

    return AlertDialog(
      title: title != null
          ? DefaultTextStyle.merge(
              child: title!,
            )
          : SizedBox(height: 16),
      titlePadding: title != null
          ? EdgeInsets.only(top: 16) + defaultPadding
          : EdgeInsets.zero,
      titleTextStyle: content == null ? themeData.textTheme.titleMedium : null,
      contentPadding: effectiveContentPadding,
      content: content != null
          ? DefaultTextStyle.merge(
              child: content!,
            )
          : SizedBox.shrink(),
      contentTextStyle: themeData.textTheme.bodyLarge,
      actions: actions,
      actionsAlignment: actionsAlignment,
    );
  }
}

@immutable
class CommonDialogAction {
  const CommonDialogAction({required this.label, required this.onTap});

  final String label;

  /// Null を渡せば、ボタンが非活性になる
  final VoidCallback? onTap;
}
