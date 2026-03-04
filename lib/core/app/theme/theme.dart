import 'package:fff_app/core/app/theme/color_schemes.dart';
import 'package:fff_app/core/app/theme/text_theme.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

abstract final class AppThemeData {
  static ThemeData get light {
    return _base(ProjectColorSchemes.blue.light);
  }

  static ThemeData get dark {
    return _base(ProjectColorSchemes.blue.dark);
  }

  static ThemeData _base(ColorScheme colorScheme) {
    final foundation = ThemeData(
      colorScheme: colorScheme,
      fontFamily: defaultFontFamily,
    );

    InputBorder inputBorder(BorderSide borderSide) => OutlineInputBorder(
      borderRadius: BorderRadius.all(
        SmoothRadius(cornerRadius: 8, cornerSmoothing: 0.2),
      ),
      borderSide: borderSide,
    );

    return foundation.copyWith(
      cardTheme: CardThemeData(
        clipBehavior: Clip.antiAlias,
        color: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            SmoothRadius(cornerRadius: 8, cornerSmoothing: 0.2),
          ),
        ),
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: SmoothRadius(cornerRadius: 16, cornerSmoothing: 0.2),
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            SmoothRadius(cornerRadius: 8, cornerSmoothing: 0.2),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHigh,
        enabledBorder: inputBorder(BorderSide(color: colorScheme.outline)),
        focusedBorder: inputBorder(BorderSide(color: colorScheme.primary)),
        errorBorder: inputBorder(BorderSide(color: colorScheme.outline)),
        focusedErrorBorder: inputBorder(BorderSide(color: colorScheme.error)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
        ),
      ),
    );
  }
}
