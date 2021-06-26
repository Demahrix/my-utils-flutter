import 'package:flutter/material.dart';
import 'package:my_utils/src/services/theme_switcher_bloc.dart';

class ThemeToggleButton extends StatelessWidget {

  final ThemeSwitcherBloc bloc;
  ThemeToggleButton(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      initialData: bloc.mode,
      stream: bloc.listen,
      builder: (_, snapshot) {
        final data = snapshot.data!;
        return IconButton(
          onPressed: bloc.change,
          icon: Icon(
            data == ThemeMode.light ? Icons.wb_sunny_outlined : Icons.nights_stay_outlined,
            color: Theme.of(context).iconTheme.color
          ),
          tooltip: "Mode jour/nuit",
        );
      }
    );
  }

}
