import 'package:fff_app/core/app/components/form/form_scaffold.dart';
import 'package:fff_app/core/app/components/route_animations/route_animations.dart';
import 'package:fff_app/features/debug_form/components/debug_form.dart';
import 'package:fff_app/features/debug_form/models/debug_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DebugFormPage extends HookWidget {
  const DebugFormPage._();

  static const routeName = '/debug_form';

  static Route<void> route() {
    return RouteAnimations.swipeBack<void>(
      fullscreenDialog: true,
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DebugFormPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      title: const Text('フォーム'),
      save: (listener) {
        Navigator.of(context).pop();
      },
      formBuilder: (listener) => DebugForm(
        initialValue: const DebugFormModel(
          name: '田中太郎',
          email: '',
          password: 'パスワード',
          gender: DebugModelGender.male,
        ),
        listener: listener,
      ),
    );
  }
}
