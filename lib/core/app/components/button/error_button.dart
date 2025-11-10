import 'package:fff_app/core/app/components/button/primary_button.dart';
import 'package:flutter/material.dart';

class ErrorButton extends StatelessWidget {
  const ErrorButton({super.key, required this.child, required this.onPressed});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      backgroundColor: Theme.of(context).colorScheme.error,
      foregroundColor: Theme.of(context).colorScheme.onError,
      onPressed: onPressed,
      child: child,
    );
  }
}
