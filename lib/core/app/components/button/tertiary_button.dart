import 'package:flutter/material.dart';

import '../button_unit/button_size.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    super.key,
    required this.child,
    required this.onPressed,
  }) : size = ButtonSize.medium;

  const TertiaryButton.small({
    super.key,
    required this.child,
    required this.onPressed,
  }) : size = ButtonSize.small;

  const TertiaryButton.large({
    super.key,
    required this.child,
    required this.onPressed,
  }) : size = ButtonSize.large;

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: size.padding,
        textStyle: size.getTextStyle(context),
        minimumSize: size.minimumSize,
      ),
      child: child,
    );
  }
}
