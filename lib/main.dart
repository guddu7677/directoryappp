import 'package:directoryapp/core/utils/routes.dart';
import 'package:directoryapp/module/authentication/provider/navigation_provider.dart';
import 'package:directoryapp/module/authentication/services/fcm_service.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await FCMTokenService.backgroundNotificationHandler(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  String? fcmToken = await FCMTokenService.getFCMToken();
  print('FCM Token in main(): $fcmToken');
  
  FCMTokenService.setupForegroundNotification();
  
  FCMTokenService.listenToTokenRefresh();
  
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