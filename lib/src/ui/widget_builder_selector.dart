import 'package:flutter/material.dart';

class WidgetBuilderSelector extends StatelessWidget {

  final int index;
  final List<Widget Function()> builders;

  const WidgetBuilderSelector({
    Key? key,
    required this.index,
    required this.builders
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return builders[index]();
  }
}
