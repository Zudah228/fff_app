import 'package:flutter/material.dart';

class BottomSheetScaffold extends StatelessWidget {
  const BottomSheetScaffold({
    super.key,
    this.title,
    required this.child,
  });

  final Widget? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CloseButton(),
              if (title case final title?)
                Expanded(child: Center(child: title))
              else
                Spacer(),
              IgnorePointer(
                child: Visibility.maintain(
                  visible: false,
                  child: CloseButton(),
                ),
              ),
            ],
          ),
          Flexible(child: child),
        ],
      ),
    );
  }
}
