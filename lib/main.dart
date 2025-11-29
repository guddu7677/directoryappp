import 'package:directoryapp/core/utils/routes.dart';
import 'package:directoryapp/module/authentication/provider/navigation_provider.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => AuthNavigationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authNav = context.watch<AuthNavigationProvider>();

    return MaterialApp(
      navigatorKey: authNav.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: authNav.currentRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
