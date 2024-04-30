import 'package:flutter/material.dart';

class MyDropdown<T> extends DropdownButtonFormField<T> {

  MyDropdown({
    super.key,
    super.value,
    super.hint,
    required List<T> values,
    super.onChanged,
    super.decoration,
    required Widget Function(T) itemBuilder
  }): super(
    items: List.generate(values.length, (index) => DropdownMenuItem(value: values[index], child: itemBuilder(values[index])))
  );

}
