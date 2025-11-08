import 'package:fff_app/core/app/components/button/primary_button.dart';
import 'package:fff_app/core/app/components/button/secondary_button.dart';
import 'package:fff_app/core/app/components/button/tertiary_button.dart';
import 'package:flutter/material.dart';

class DebugComponentsPage extends StatelessWidget {
  const DebugComponentsPage._();

  static const routeName = '/debug_components';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DebugComponentsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コンポーネント一覧'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Text('Button', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            children: [
              PrimaryButton(
                child: const Text('Primary Button'),
                onPressed: () {},
              ),
              SecondaryButton(
                child: const Text('Secondary Button'),
                onPressed: () {},
              ),
              TertiaryButton(
                child: const Text('Tertiary Button'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
