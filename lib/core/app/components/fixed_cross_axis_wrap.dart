import 'package:flutter/material.dart';

class FixedCrossAxisWrap extends StatelessWidget {
  const FixedCrossAxisWrap({
    super.key,
    required this.crossAxisCount,
    required this.children,
    this.mainAxisSpace = 0.0,
    this.crossAxisSpace = 0.0,
  });

  final List<Widget> children;
  final int crossAxisCount;
  final double mainAxisSpace;
  final double crossAxisSpace;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: mainAxisSpace,
      children: [
        for (var i = 0; i < (children.length / crossAxisCount).ceil(); i++)
          IntrinsicHeight(
            child: Row(
              children: [
                for (var j = 0; j < crossAxisCount; j++)
                  if (children.elementAtOrNull(i * crossAxisCount + j)
                      case final child?)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: j == 0 ? 0.0 : crossAxisSpace / 2,
                          right: j == crossAxisCount - 1
                              ? 0.0
                              : crossAxisSpace / 2,
                        ),
                        child: child,
                      ),
                    )
                  else
                    const Spacer(),
              ],
            ),
          ),
      ],
    );
  }
}
