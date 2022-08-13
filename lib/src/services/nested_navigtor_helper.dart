import 'package:flutter/material.dart';

class NestedNavigatorHelper extends StatelessWidget {

  final GlobalKey<NavigatorState> navigationKey;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final List<NavigatorObserver> observers;

  const NestedNavigatorHelper({
    super.key, 
    required this.navigationKey,
    required this.initialRoute,
    required this.onGenerateRoute,
    this.observers = const []
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (navigationKey.currentState!.canPop()) {
          navigationKey.currentState!.pop();
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },
      child: Navigator(
        key: navigationKey,
        initialRoute: initialRoute,
        observers: observers,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
