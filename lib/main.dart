
import 'package:directoryapp/module/home/provider/auth_wapper.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:directoryapp/module/authentication/views/screens/login_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/home_item_details.dart';
import 'package:directoryapp/module/jobboard/view/job_board_details_page.dart';
import 'package:directoryapp/module/jobboard/view/Job_board_screen.dart';
import 'package:directoryapp/module/jobboard/view/add_job_screen.dart';
import 'package:directoryapp/module/jobposting/views/Job_posting_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/notification_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/about_us_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/bookmark_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/help_support_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/payment_history_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/privacy_policy_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/rating_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/search_filter_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/personal_information.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/subscription_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/term_conditions.dart';
import 'package:directoryapp/module/home/views/homeScreen/main_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/address_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/otp_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/profile_register.dart';
import 'package:directoryapp/module/authentication/views/screens/register_screen.dart';
import 'package:directoryapp/module/setting/view/setting_screen.dart';
import 'package:directoryapp/module/splashscreen/views/onbording_screen.dart';
import 'package:directoryapp/module/splashscreen/views/splash_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        // ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => JobProvider()),
      ],
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "/SplashScreen": (context) => SplashScreen(),
        "/OnboardingScreen": (context) => OnboardingScreen(),
        "/RegisterScreen": (context) => RegisterScreen(),
        "/LoginScreen": (context) => LoginScreen(),
        "/OtpScreen": (context) => OtpScreen(),
        "/ProfileRegister": (context) => ProfileRegister(),
        "/AddressScreen": (context) => AddressScreen(),
        "/MainScreen": (context) => MainScreen(),
        "/SearchfilterScreen": (context) => SearchfilterScreen(),
        "/HomeItemDetails": (context) => HomeItemDetails(),
        "/JobPostingScreen": (context) => JobPostingScreen(),
        "/AddJobScreen": (context) => AddJobScreen(),
        "/Jobboardscreen": (context) => Jobboardscreen(),
        "/JobBoardDetailsPage": (context) => JobBoardDetailsPage(),
        "/SettingScreen": (context) => SettingScreen(),
        "/NotificationScreen": (context) => NotificationScreen(),
        "/SubscriptionScreen": (context) => SubscriptionScreen(),
        "/RatingScreen": (context) => RatingScreen(),
        "/PersonalInformation": (context) => PersonalInformation(),
        "/PaymentHistoryScreen": (context) => PaymentHistoryScreen(),
        "/BookmarkScreen": (context) => BookmarkScreen(),
        "/HelpSupportScreen": (context) => HelpSupportScreen(),
        "/AboutUsScreen": (context) => AboutUsScreen(),
        "/PrivacyPolicyScreen": (context) => PrivacyPolicyScreen(),
        "/TermConditions": (context) => TermConditions(),
      },
    );
  }
}
