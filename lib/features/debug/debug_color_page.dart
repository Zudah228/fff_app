import 'package:fff_app/core/app/components/route_animations/route_animations.dart';
import 'package:fff_app/core/app/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class DebugColorPage extends StatelessWidget {
  const DebugColorPage._();

  static const routeName = '/debug_color';

  static Route<void> route() {
    return RouteAnimations.swipeBack<void>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DebugColorPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color'),
      ),
      body: ListView.builder(
        itemCount: ProjectColors.all.length,
        itemBuilder: (context, index) {
          final colorScheme = ProjectColorSchemes.fromColor(
            ProjectColors.all[index],
          );
          return ListTile(
            title: Text(colorScheme.name),
            leading: Container(
              width: 20,
              height: 20,
              color: colorScheme
                  .fromBrightness(Theme.of(context).brightness)
                  .primary,
            ),
          );
        },
      ),
    );
  }
}
