import 'package:fff_app/core/app/components/separator.dart';
import 'package:flutter/material.dart';

class SettingListBox extends StatelessWidget {
  const SettingListBox({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: ShapeDecoration(
        color: themeData.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: children.separatedWith(
          Divider(
            color: themeData.colorScheme.outlineVariant,
            height: 1,
          ),
        ),
      ),
    );
  }
}
