import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FCMTokenService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  
  static Future<String?> getFCMToken() async {
    try {
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        String? token = await _firebaseMessaging.getToken();
        
        if (token != null) {
          if (kDebugMode) {
            print('FCM Token: $token');
          }
          // Fluttertoast.showToast(msg: "Get FCM Token ");
          return token;
        } else {
          if (kDebugMode) {
            print(' FCM Token null ');
          }
        }
      } else {
        if (kDebugMode) {
          print('Notification Permission denied');
        }
        Fluttertoast.showToast(msg: "Required Notification permission");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting FCM token: $e');
      }
      Fluttertoast.showToast(msg: "FCM Token Error: $e");
    }
    return null;
  }

  static void listenToTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      if (kDebugMode) {
        print('FCM Token Refreshed: $newToken');
      }
      
    });
  }

  static void setupForegroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Foreground Notification:');
        print('Title: ${message.notification?.title}');
        print('Body: ${message.notification?.body}');
        print('Data: ${message.data}');
      }

      if (message.notification != null) {
        Fluttertoast.showToast(
          msg: "${message.notification!.title}\n${message.notification!.body}",
        );
      }
    });
  }

  static Future<void> backgroundNotificationHandler(RemoteMessage message) async {
    if (kDebugMode) {
      print(' Background Notification:');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
    }
  }
}