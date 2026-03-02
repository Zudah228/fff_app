import 'package:flutter/material.dart';

enum ButtonSize {
  small,
  medium,
  large;

  Size get minimumSize => switch (this) {
    ButtonSize.small => Size(0, 32),
    ButtonSize.medium => Size(0, 40),
    ButtonSize.large => Size(double.infinity, 56),
  };

  EdgeInsetsGeometry get padding => switch (this) {
    ButtonSize.small => EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ButtonSize.medium => EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    ButtonSize.large => EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  };

  TextStyle getTextStyle(BuildContext context) => switch (this) {
    ButtonSize.small => Theme.of(context).textTheme.bodySmall!,
    ButtonSize.medium => Theme.of(context).textTheme.bodyMedium!,
    ButtonSize.large => Theme.of(context).textTheme.bodyLarge!,
  };
}
