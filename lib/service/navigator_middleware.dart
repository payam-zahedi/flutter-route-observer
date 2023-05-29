import 'dart:developer';
import 'package:flutter/material.dart';

typedef OnRouteChange<R extends Route<dynamic>> = void Function(
    R route, R? previousRoute);

class NavigatorMiddleware<R extends Route<dynamic>> extends RouteObserver<R> {
  NavigatorMiddleware({
    this.enableLogger = true,
    this.onPush,
    this.onPop,
    this.onReplace,
    this.onRemove,
  }) : _stack = [];
    
   /// Use of this navigatorKey is optional
   /// Used to efficiently monitor and react to route changes
   /// Enables you to implement custom behaviors or perform specific tasks during navigation transitions.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    
  final List<R> _stack;
  final bool enableLogger;
  final OnRouteChange<R>? onPush;
  final OnRouteChange<R>? onPop;
  final OnRouteChange<R>? onReplace;
  final OnRouteChange<R>? onRemove;
  List<R> get stack => List<R>.from(_stack);
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route as R);
    _logStack();
    if (onPush != null) {
      onPush!(route, previousRoute as R?);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
    if (onPop != null) {
      onPop!(route as R, previousRoute as R?);
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _logger('{didReplace} \n newRoute: $newRoute \n oldRoute: $oldRoute');
    if (_stack.contains(oldRoute)) {
      final oldItemIndex = _stack.indexOf(oldRoute as R);
      _stack[oldItemIndex] = newRoute as R;
    }
    _logStack();
    if (onReplace != null) {
      onReplace!(newRoute as R, oldRoute as R?);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger('{didRemove} \n route: $route \n previousRoute: $previousRoute');
    stack.remove(route);
    _logStack();
    if (onRemove != null) {
      onRemove!(route as R, previousRoute as R?);
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger(
        '{didStartUserGesture} \n route: $route \n previousRoute: $previousRoute');
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    _logger('{didStopUserGesture}');
    super.didStopUserGesture();
  }

  void _logStack() {
    final mappedStack =
        _stack.map((Route route) => route.settings.name).toList();
    _logger('Navigator stack: $mappedStack');
  }

  void _logger(String content) {
    if (enableLogger) {
      log(content);
    }
  }
}
