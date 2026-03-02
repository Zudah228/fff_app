import 'package:flutter/material.dart';

import '../button_unit/button_size.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  }) : size = ButtonSize.medium;

  const PrimaryButton.small({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  }) : size = ButtonSize.small;

  const PrimaryButton.large({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  }) : size = ButtonSize.large;

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: size.padding,
        textStyle: size.getTextStyle(context),
        minimumSize: size.minimumSize,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
