import 'package:fff_app/core/app/app.dart';
import 'package:fff_app/core/app/app_state.dart';
import 'package:fff_app/core/service/package_info/package_info_service.dart';
import 'package:fff_app/core/service/shared_preferences/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'ja_JP';

  late final PackageInfoService packageInfoService;
  late final SharedPreferencesService sharedPreferencesService;

  await Future.wait([
    Future(() async {
      packageInfoService = await PackageInfoService.init();
    }),
    Future(() async {
      sharedPreferencesService = await SharedPreferencesService.init();
    }),
  ]);

  final container = ProviderContainer(
    overrides: [
      packageInfoServiceProvider.overrideWithValue(packageInfoService),
      sharedPreferencesServiceProvider.overrideWithValue(
        sharedPreferencesService,
      ),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: AppStateProvider(
        sharedPreferencesService: sharedPreferencesService,
        child: const MainApp(),
      ),
    ),
  );
}
