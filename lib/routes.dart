import 'package:flutter/material.dart';

class RouteNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
       GlobalKey<NavigatorState>();

  static Future<dynamic>? pushReplacementNamed<Arguments>(
  {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushNamed<Arguments>(
  {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }

}