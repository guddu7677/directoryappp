import 'package:directoryapp/module/authentication/views/screens/address_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/profile_register.dart';
import 'package:directoryapp/module/home/views/homeScreen/home_item_details.dart';
import 'package:directoryapp/module/home/views/homeScreen/home_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/search_filter_screen.dart';
import 'package:directoryapp/module/jobboard/view/Job_board_screen.dart';
import 'package:directoryapp/module/jobboard/view/add_job_screen.dart';
import 'package:directoryapp/module/jobboard/view/job_board_details_page.dart';
import 'package:directoryapp/module/jobposting/views/Job_posting_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/about_us_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/bookmark_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/help_support_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/notification_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/payment_history_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/personal_information.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/privacy_policy_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/rating_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/subscription_screen.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/views/term_conditions.dart';
import 'package:flutter/material.dart';
import 'package:directoryapp/module/splashscreen/views/splash_screen.dart';
import 'package:directoryapp/module/splashscreen/views/onbording_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/login_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/register_screen.dart';
import 'package:directoryapp/module/authentication/views/screens/otp_screen.dart';
import 'package:directoryapp/module/home/views/homeScreen/main_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/SplashScreen":
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case "/OnboardingScreen":
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());

    case "/LoginScreen":
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    case "/RegisterScreen":
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case "/OtpScreen":
      final args = settings.arguments;
      String phone = "";
      bool isLogin = true;

      if (args is Map<String, dynamic>) {
        phone = args["phone"] ?? "";
        isLogin = args["isLogin"] ?? true;
      } else if (args is String) {
        phone = args;
        isLogin = true;
      }

      return MaterialPageRoute(
        builder: (_) => OtpScreen(mobile: phone, isLogin: isLogin),
      );

    case "/ProfileRegister":
      return MaterialPageRoute(builder: (_) => const ProfileRegister());

    case "/AddressScreen":
      return MaterialPageRoute(builder: (_) => const AddressScreen());

    case "/MainScreen":
      return MaterialPageRoute(builder: (_) => const MainScreen());
    case "/HomeScreen":
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case "/HomeItemDetails":
      return MaterialPageRoute(builder: (_) => const HomeItemDetails());

    case "/SearchfilterScreen":
      return MaterialPageRoute(builder: (_) => const SearchfilterScreen());

    case "/Jobboardscreen":
      return MaterialPageRoute(builder: (_) => const Jobboardscreen());

    case "/JobBoardDetailsPage":
      return MaterialPageRoute(builder: (_) => const JobBoardDetailsPage());

    case "/AddJobScreen":
      return MaterialPageRoute(builder: (_) => const AddJobScreen());

    case "/JobPostingScreen":
      return MaterialPageRoute(builder: (_) => const JobPostingScreen());

    case "/PersonalInformation":
      return MaterialPageRoute(builder: (_) => const PersonalInformation());

    case "/SubscriptionScreen":
      return MaterialPageRoute(builder: (_) => const SubscriptionScreen());

    case "/RatingScreen":
      return MaterialPageRoute(builder: (_) => const RatingScreen());

    case "/TermConditions":
      return MaterialPageRoute(builder: (_) => const TermConditions());
    case "/AboutUsScreen":
      return MaterialPageRoute(builder: (_) => const AboutUsScreen());
    case "/PrivacyPolicyScreen":
      return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
    case "/BookmarkScreen":
      return MaterialPageRoute(builder: (_) => const BookmarkScreen());
    case "/PaymentHistoryScreen":
      return MaterialPageRoute(builder: (_) => const PaymentHistoryScreen());
    case "/HelpSupportScreen":
      return MaterialPageRoute(builder: (_) => const HelpSupportScreen());

    case "/NotificationScreen":
      return MaterialPageRoute(builder: (_) => const NotificationScreen());
    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
