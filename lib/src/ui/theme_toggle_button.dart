import 'package:flutter/material.dart';
import 'package:my_utils/src/services/theme_switcher_bloc.dart';

class ThemeToggleButton extends StatelessWidget {

  final Widget lightIcon;
  final Widget darkIcon;
  final ThemeSwitcherBloc bloc;

  // 🌚🌜☀️🌞
  const ThemeToggleButton(
    this.bloc, {
      super.key,
      this.lightIcon = const Icon(Icons.wb_sunny_outlined, color: Colors.black),
      this.darkIcon = const Icon(Icons.nights_stay_outlined, color: Colors.white)
  });

  const ThemeToggleButton.unicode(this.bloc, { Key? key }):
    lightIcon = const Text(
        "🌜",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
        ),
    ), darkIcon = const Text(
        "🌞",
        style: TextStyle(
          fontSize: 18.0
        ),
    ), super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      onPressed: bloc.change,
      icon: isLight ? lightIcon : darkIcon,
      tooltip: "Mode jour/sombre",
    );
  }

}
