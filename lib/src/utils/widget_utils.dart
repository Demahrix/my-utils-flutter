import 'package:flutter/material.dart';

class MyWidgetUtils {

  static List<Widget> separatedListBuilder(
    int length, {
      required Widget Function(int index) builder,
      required Widget Function(int index) separatedBuilder
    }) => List<Widget>.generate(length == 0 ? 0 : length * 2 - 1, (index) {
      if (index & 1 == 1)
        return separatedBuilder(index ~/ 2);
      return builder(index ~/ 2);
    }, growable: false);

  static List<Widget> separatedListBuilderAlt<T>(
    List<T> items, {
      required Widget Function(T item, int index) builder,
      required Widget Function(int index) separatedBuilder
    }) {
      var count = items.length;
      return List<Widget>.generate(count == 0 ? 0 : count * 2 - 1, (index) {
        if (index & 1 == 1)
          return separatedBuilder(index ~/ 2);
        var rIndex =  index ~/ 2;
        return builder(items[rIndex], rIndex);
      }, growable: false);
    }

}
