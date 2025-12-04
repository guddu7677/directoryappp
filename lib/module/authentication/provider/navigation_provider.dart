import 'package:flutter/material.dart';

class AuthNavigationProvider extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String _currentRoute = "/ProfileRegister";
  String get currentRoute => _currentRoute;

  void navigateTo(String route) {
    _currentRoute = route;
    notifyListeners();

    navigatorKey.currentState?.pushReplacementNamed(route);
  }
}
