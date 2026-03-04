import 'package:flutter/material.dart';

final class ProjectColorSchemes {
  const ProjectColorSchemes._();

  static ColorSchemeData get red => _red;
  static ColorSchemeData get blue => _blue;
  static ColorSchemeData get green => ColorSchemeData(
    name: 'green',
    light: ColorScheme.fromSeed(
      seedColor: ProjectColors.green,
      brightness: Brightness.light,
      primary: ProjectColors.green,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1F1F1F),
      error: ProjectColors.green,
      onError: Colors.white,
    ),
    dark: ColorScheme.fromSeed(
      seedColor: ProjectColors.greenDark,
      brightness: Brightness.dark,
      primary: ProjectColors.greenDark,
    ),
  );
  static ColorSchemeData get yellow => ColorSchemeData(
    name: 'yellow',
    light: ColorScheme.fromSeed(
      seedColor: ProjectColors.yellow,
      brightness: Brightness.light,
      primary: ProjectColors.yellow,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1F1F1F),
    ),
    dark: ColorScheme.fromSeed(
      seedColor: ProjectColors.yellowDark,
      brightness: Brightness.dark,
      primary: ProjectColors.yellowDark,
      onPrimary: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE1E1E1),
    ),
  );
  static ColorSchemeData get purple => ColorSchemeData(
    name: 'purple',
    light: ColorScheme.fromSeed(
      seedColor: ProjectColors.purple,
      brightness: Brightness.light,
      primary: ProjectColors.purple,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1F1F1F),
    ),
    dark: ColorScheme.fromSeed(
      seedColor: ProjectColors.purpleDark,
      brightness: Brightness.dark,
      primary: ProjectColors.purpleDark,
      onPrimary: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE1E1E1),
    ),
  );
  static ColorSchemeData get orange => ColorSchemeData(
    name: 'orange',
    light: ColorScheme.fromSeed(
      seedColor: ProjectColors.orange,
      brightness: Brightness.light,
      primary: ProjectColors.orange,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1F1F1F),
    ),
    dark: ColorScheme.fromSeed(
      seedColor: ProjectColors.orangeDark,
      brightness: Brightness.dark,
      primary: ProjectColors.orangeDark,
      onPrimary: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE1E1E1),
    ),
  );

  static ColorSchemeData fromColor(Color color) {
    switch (color) {
      case ProjectColors.red:
        return red;
      case ProjectColors.blue:
        return blue;
      case ProjectColors.green:
        return green;
      case ProjectColors.yellow:
        return yellow;
      case ProjectColors.purple:
        return purple;
      case ProjectColors.orange:
        return orange;
      default:
        return ColorSchemeData(
          name: color.toString(),
          light: ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.light,
            primary: color,
          ),
          dark: ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.dark,
            primary: color,
          ),
        );
    }
  }
}

abstract final class ProjectColors {
  static const Color red = Color(0xFFE53935);
  static const Color redDark = Color(0xFFEF5350);
  static const Color blue = Color(0xFF007AFF);
  static const Color blueDark = Color(0xFF0c59f2);
  static const Color green = Color(0xFF34c759);
  static const Color greenDark = Color(0xFF32D74B);
  static const Color yellow = Color(0xFFffcc00);
  static const Color yellowDark = Color(0xFFffcc00);
  static const Color purple = Color(0xFF9B36B7);
  static const Color purpleDark = Color(0xFFA044E5);
  static const Color orange = Color(0xFFff9500);
  static const Color orangeDark = Color(0xFFf49d10);

  static const List<Color> all = [
    red,
    blue,
    green,
    yellow,
    purple,
    orange,
  ];
}

class ColorSchemeData {
  const ColorSchemeData({
    required this.name,
    required this.light,
    required this.dark,
  });

  final String name;
  final ColorScheme light;
  final ColorScheme dark;

  ColorScheme fromBrightness(Brightness brightness) => switch (brightness) {
    Brightness.light => light,
    Brightness.dark => dark,
  };
}

ColorSchemeData get _red {
  return ColorSchemeData(
    name: 'red',
    light: ColorScheme.fromSeed(
      seedColor: ProjectColors.red,
      brightness: Brightness.light,
      primary: ProjectColors.red,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1F1F1F),
      error: ProjectColors.red,
      onError: Colors.white,
    ),
    dark: ColorScheme.fromSeed(
      seedColor: ProjectColors.redDark,
      brightness: Brightness.dark,
      primary: ProjectColors.redDark,
      onPrimary: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE1E1E1),
      error: ProjectColors.redDark,
      onError: Colors.black,
    ),
  );
}

ColorSchemeData get _blue {
  return ColorSchemeData(
    name: 'blue',
    light: ColorScheme.fromSeed(
      brightness: Brightness.light,
      primary: ProjectColors.blue,
      seedColor: ProjectColors.blue,
      surface: Color(0xFFf2f2f7),
      surfaceContainerHighest: Colors.white,
    ),
    dark: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ProjectColors.blueDark,
      primary: ProjectColors.blueDark,
      onPrimary: Color(0xFFf1f5f9),
      surface: Color(0xFF0f1726),
      onSurface: Color(0xFFf1f5f9),
    ),
  );
}
