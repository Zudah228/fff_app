import 'package:fff_app/core/app/components/form/radio/radio_field.dart';
import 'package:flutter/material.dart';

export 'radio_field.dart';

class RadioFormField<T> extends FormField<T> {
  RadioFormField({
    super.key,
    required super.validator,
    required super.initialValue,
    required List<RadioValue<T>> values,
  }) : super(
         builder: (field) => RadioField(
           groupValue: field.value,
           onChanged: (value) => field.didChange(value),
           values: values,
           errorText: field.errorText,
         ),
       );
}
