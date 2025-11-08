import 'package:fff_app/core/app/components/route_animations/route_animations.dart';
import 'package:fff_app/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  static Route<void> route() {
    return RouteAnimations.swipeBack<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, SettingsPage.route());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(child: Text('HomePage')),
    );
  }
}
