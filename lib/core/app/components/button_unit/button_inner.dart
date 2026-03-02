import 'package:flutter/material.dart';

class ButtonInner extends StatelessWidget {
  const ButtonInner({super.key, required this.label, required this.icon});

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        icon,
        Flexible(child: label),
        SizedBox(width: 4),
      ],
    );
  }
}
