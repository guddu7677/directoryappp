import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentRoute = "/SplahScreen";
  String get currentRoute => _currentRoute;

  Future<void> checkAuth() async {
    final token = await ApiService().getAuthToken();
    if (token != null && token.isNotEmpty) {
      navigateTo("/MainScreen");
    } else {
      navigateTo("/OnboardingScreen");
    }
  }

  void loginSuccess() {
    navigateTo("/MainScreen");
  }

  Future<void> logout() async {
    await ApiService().logOut();
    navigateTo("/LoginScreen");
  }

  void navigateTo(String route) {
    if (_currentRoute == route) return;
    _currentRoute = route;
    notifyListeners();
    navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false);
  }
}
