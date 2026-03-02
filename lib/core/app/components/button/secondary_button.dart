import 'package:flutter/material.dart';

import '../button_unit/button_size.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.child,
    required this.onPressed,
  }) : size = ButtonSize.medium;

  const SecondaryButton.small({
    super.key,
    required this.child,
    required this.onPressed,
  }) : size = ButtonSize.small;

  const SecondaryButton.large({
    super.key,
    required this.child,
    required this.onPressed,
  }) : size = ButtonSize.large;

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: size.padding,
        textStyle: size.getTextStyle(context),
        minimumSize: size.minimumSize,
      ),
      child: child,
    );
  }
}
