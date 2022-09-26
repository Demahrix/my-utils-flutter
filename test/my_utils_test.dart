import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_utils/src/services/theme_switcher_bloc.dart';
import 'package:my_utils/src/services/unique_instance.dart';
import 'package:my_utils/src/utils/my_http_utils.dart';

class Exemple {
  final int a;
  final int b;
  Exemple(this.a, this.b);
}

void main() {
  test("switch theme", () async {

    final Completer<void> completer = Completer();

    ThemeSwitcherBloc bloc = ThemeSwitcherBloc(
    );

    expect(ThemeMode.light, bloc.mode);

    bloc.listen.listen((event) {
      expect(ThemeMode.dark, event);
      completer.complete();
    });

    bloc.change();

    return completer.future;
  });

  group("test register", () {

    final Exemple exemple = Exemple(2, 3);

    test("contains instance", () {
      final UniqueInstance instance = UniqueInstance.getInstance();
      instance.register<Exemple>(exemple);
      expect(instance.contains<Exemple>(), true);
    });

    test("get register instance", () {
      final UniqueInstance instance = UniqueInstance.getInstance();
      expect(instance.get<Exemple>(), exemple);
    });

    test("get register instance", () {
      final UniqueInstance instance = UniqueInstance.getInstance();
      instance.delete<Exemple>();
      expect(instance.contains<Exemple>(), false);
    });

  });

  group("test lazy register", () {

  });

  group("Http utils", () {

    test('Map to query params', () {

      expect(MyHttpUtils.toQuery({
        'id': 'abc',
        'price': 100,
        'startDate': '21/12/2021',
        'endDate': null
      }), 'id=abc&price=100&startDate=21/12/2021');

    });

  });

}
