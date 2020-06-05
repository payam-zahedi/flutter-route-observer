import 'dart:developer';

import 'package:flutter/material.dart';

class NavigatorMiddleware<R extends Route<dynamic>> extends NavigatorObserver {
  NavigatorMiddleware({this.enableLogger = true}) : _stack = [];

  final List<R> _stack;
  final bool enableLogger;

  //create clone list from stack
  List<R> get stack => List<R>.from(_stack);

  @override
  void didPush(Route route, Route previousRoute) {
    log('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route);
    _logStack();
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    log('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    log('{didReplace} \n newRoute: $newRoute \n oldRoute: $oldRoute');
    if (_stack.indexOf(oldRoute) >= 0) {
      final oldItemIndex = _stack.indexOf(oldRoute);
      _stack[oldItemIndex] = newRoute;
    }
    _logStack();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    log('{didRemove} \n route: $route \n previousRoute: $previousRoute');
    stack.remove(route);
    _logStack();
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    log('{didStartUserGesture} \n route: $route \n previousRoute: $previousRoute');
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    log('{didStopUserGesture}');
    super.didStopUserGesture();
  }

  void _logStack() {
    final mappedStack = _stack.map((Route route) => route.settings.name).toList();

    log('Navigator stack: $mappedStack');
  }

  void _logget(String content) {}
}
