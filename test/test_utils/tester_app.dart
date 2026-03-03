import 'package:alchemist/alchemist.dart' show TestAssetBundle;
import 'package:fff_app/core/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TesterApp extends StatelessWidget {
  const TesterApp({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: TestAssetBundle(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        theme: AppThemeData.light,
        darkTheme: AppThemeData.dark,
        home: child,
      ),
    );
  }
}
