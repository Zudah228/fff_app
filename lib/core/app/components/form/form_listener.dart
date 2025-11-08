import 'package:fff_app/core/app/components/form/form_scaffold.dart';
import 'package:flutter/widgets.dart';

class FormListener<T extends FormScaffoldState<dynamic>> with ChangeNotifier {
  T? _state;

  T get state => _state!;
  T? get stateOrNull => _state;

  void attach(T state) {
    _state = state;
  }

  void onChanged() {
    notifyListeners();
  }

  bool get isValid => _state?.isValid ?? false;
}
