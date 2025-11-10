import 'package:fff_app/core/app/components/bottom_sheet/bottom_sheet_scaffold.dart';
import 'package:flutter/material.dart';

class SelectionBottomSheet extends StatelessWidget {
  const SelectionBottomSheet({
    super.key,
    this.title,
    required this.itemBuilder,
    required this.itemCount,
  });

  final Widget? title;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      title: title,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 0.5,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
