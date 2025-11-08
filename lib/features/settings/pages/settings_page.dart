import 'package:fff_app/core/app/app_state.dart';
import 'package:fff_app/core/app/components/route_animations/route_animations.dart';
import 'package:fff_app/features/debug/debug_page.dart';
import 'package:fff_app/features/settings/components/setting_list_box.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._();

  static const routeName = '/settings';

  static Route<void> route() {
    return RouteAnimations.swipeBack<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SettingsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SettingListBox(
          children: [
            _ThemeModeButton(),
            _ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('ライセンス'),
              onTap: () {
                Navigator.of(context).push(
                  RouteAnimations.noAnimation<void>(
                    settings: const RouteSettings(name: '/license'),
                    builder: (_) => const LicensePage(),
                  ),
                );
              },
            ),
            _ListTile(
              leading: const Icon(Icons.bug_report),
              title: const Text('デバッグ'),
              onTap: () {
                Navigator.of(context).push(DebugPage.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    required this.onTap,
    this.leading,
    this.subtitle,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        minVerticalPadding: 8,
        title: title,
        leading: leading,
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }
}

class _ThemeModeButton extends StatelessWidget {
  const _ThemeModeButton();

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return PopupMenuButton<ThemeMode>(
      position: PopupMenuPosition.under,
      initialValue: appState.themeMode,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: ThemeMode.light,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Icon(Icons.light_mode),
              Text('ライトモード'),
            ],
          ),
        ),
        PopupMenuItem(
          value: ThemeMode.dark,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Icon(Icons.dark_mode),
              Text('ダークモード'),
            ],
          ),
        ),
        PopupMenuItem(
          value: ThemeMode.system,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Icon(Icons.monitor),
              Text('システム'),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        appState.updateThemeMode(value);
      },
      child: Builder(
        builder: (context) {
          return _ListTile(
            leading: Icon(switch (Theme.of(context).brightness) {
              Brightness.light => Icons.light_mode,
              Brightness.dark => Icons.dark_mode,
            }),
            title: const Text('テーマ'),
            subtitle: Text(switch (appState.themeMode) {
              ThemeMode.light => 'ライトモード',
              ThemeMode.dark => 'ダークモード',
              ThemeMode.system => 'システムに従っています',
            }),
            onTap: () {
              context
                  .findAncestorStateOfType<PopupMenuButtonState<ThemeMode>>()
                  ?.showButtonMenu();
            },
          );
        },
      ),
    );
  }
}
