import 'package:directoryapp/module/home/views/homeScreen/HomeItemDetails/home_item_details.dart';
import 'package:directoryapp/module/home/views/homeScreen/JobBoard/jobboard_details_page.dart';
import 'package:directoryapp/module/home/views/homeScreen/JobBoardScreen.dart';
import 'package:directoryapp/module/home/views/homeScreen/JobPosting/add_job_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/JobPostingScreen.dart';
import 'package:directoryapp/module/home/views/homeScreen/Notificationss/notification_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/RatingScreen/rating_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/SearchfilterScreen/searchfilter_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/Subscription/subscription_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/main_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/registerScreen/address_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/registerScreen/otp_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/registerScreen/profile_register.dart';
import 'package:directoryapp/module/authentication/views/screens/registerScreen/register_screen.dart';
import 'package:directoryapp/module/home/views/splashscreen/onbording_screen.dart';
import 'package:directoryapp/module/home/views/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatingScreen(),
      routes: {
        "/SplashScreen": (context) => SplashScreen(),
        "/OnboardingScreen": (context) => OnboardingScreen(),
        "/RegisterScreen": (context) => RegisterScreen(),
        "/OtpScreen": (context) => OtpScreen(),
        "/ProfileRegister": (context) => ProfileRegister(),
        "/MainScreen": (context) => MainScreen(),
        "/AddressScreen": (context) => AddressScreen(),
        "/SearchfilterScreen": (context) => SearchfilterScreen(),
        "/HomeItemDetails": (context) => HomeItemDetails(),
        "/JobPostingScreen": (context) => JobPostingScreen(),
        "/AddJobScreen": (context) => AddJobScreen(),
        "/Jobboardscreen": (context) => Jobboardscreen(),
        "/JobBoardDetailsPage": (context) => JobBoardDetailsPage(),
        "/NotificationScreen": (context) => NotificationScreen(),
        "/SubscriptionScreen": (context) => SubscriptionScreen(),
        "/RatingScreen": (context) => RatingScreen(),
      },
    );
  }
}
