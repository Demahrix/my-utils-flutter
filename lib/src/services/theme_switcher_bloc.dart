import 'dart:async';
import 'package:flutter/material.dart';

class ThemeSwitcherBloc {

  final List<ThemeMode> _modes;
  int _currentIndex;
  final StreamController<ThemeMode> _controller = StreamController.broadcast();

  ThemeSwitcherBloc([
    ThemeMode? mode,
  ]): _modes = [ThemeMode.light, ThemeMode.dark],
      _currentIndex = mode == null ? 0 : mode.index;

  ThemeMode get mode => _modes[_currentIndex];
  Stream<ThemeMode> get listen => _controller.stream;

  void change() {
    _currentIndex = (_currentIndex + 1) % _modes.length;
    _controller.sink.add(_modes[_currentIndex]);
  }

  void setMode(ThemeMode mode) {
    if (mode.index != _currentIndex)
      return;
    _currentIndex = mode.index;
    _controller.sink.add(mode);
  }

  void dispose() {
    _controller.close();
  }

}
