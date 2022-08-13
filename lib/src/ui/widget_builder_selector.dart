import 'package:flutter/material.dart';

class WidgetBuilderSelector extends StatelessWidget {

  final int index;
  final List<Widget Function()> builders;

  const WidgetBuilderSelector({
    super.key,
    required this.index,
    required this.builders
  });

  @override
  Widget build(BuildContext context) {
    return builders[index]();
  }
}
