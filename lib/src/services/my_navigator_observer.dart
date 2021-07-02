import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {

  final void Function(Route route, Route? previousRoute)? onDidPush;
  final void Function(Route route, Route? previousRoute)? onDidPop;
  final void Function(Route route, Route? previousRoute)? onDidRemove;
  final void Function({Route? newRoute, Route? oldRoute})? onDidReplace;

  MyNavigatorObserver({
    this.onDidPush,
    this.onDidPop,
    this.onDidRemove,
    this.onDidReplace
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    onDidPush?.call(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    onDidPop?.call(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    onDidRemove?.call(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    onDidReplace?.call(newRoute: newRoute, oldRoute: oldRoute);
  }

}
