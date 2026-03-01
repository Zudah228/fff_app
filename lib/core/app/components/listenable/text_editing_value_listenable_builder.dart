import 'package:flutter/material.dart';

class TextEditingValueListenableBuilder extends StatelessWidget {
  const TextEditingValueListenableBuilder({
    super.key,
    required this.listenable,
    required this.builder,
  });

  final ValueNotifier<TextEditingValue> listenable;
  final Widget Function(String text) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listenable,
      builder: (context, value, child) => builder(value.text),
    );
  }
}
