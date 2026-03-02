import 'package:fff_app/core/app/components/button/tertiary_button.dart';
import 'package:fff_app/core/app/components/expanded_single_child_scroll_view.dart';
import 'package:fff_app/core/app/components/form/custom_form.dart';
import 'package:fff_app/core/app/components/form/form_listener.dart';
import 'package:flutter/material.dart';

class FormScaffold<T> extends StatefulWidget {
  const FormScaffold({
    super.key,
    required this.title,
    required this.formBuilder,
    required this.save,
  });

  final Widget title;
  final void Function(FormListener<CustomFormState<T>> listener) save;
  final CustomForm<T> Function(FormListener<CustomFormState<T>> listener)
  formBuilder;

  @override
  State<FormScaffold<T>> createState() => _FormScaffoldState<T>();
}

class _FormScaffoldState<T> extends State<FormScaffold<T>> {
  late final FormListener<CustomFormState<T>> _formListener;

  @override
  void initState() {
    super.initState();
    _formListener = FormListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          ListenableBuilder(
            listenable: _formListener,
            builder: (context, child) => TertiaryButton(
              onPressed:
                  _formListener.stateOrNull?.isDirty == true &&
                      _formListener.isValid
                  ? () {
                      widget.save(_formListener);
                    }
                  : null,
              child: const Text('保存'),
            ),
          ),
        ],
      ),
      body: ExpandedSingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: 16) +
            EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: widget.formBuilder(_formListener),
      ),
    );
  }
}
