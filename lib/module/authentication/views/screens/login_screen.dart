import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:directoryapp/module/authentication/services/fcm_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  bool isLoading = false;
  final ApiService _apiService = ApiService();
  
  @override
  void initState() {
    super.initState();
    _getFCMToken();
  }

  void _getFCMToken() async {
    String? token = await FCMTokenService.getFCMToken();
    if (token != null) {
      print(' FCM Token in LoginScreen: $token');
    }
  }

  void _login() async {
    final phone = phoneController.text.trim();
    if (phone.isEmpty || phone.length != 10) {
      Fluttertoast.showToast(msg: "please enter valid phone number 10 digit");
      return; 
    }
    
    setState(() => isLoading = true);
    
    String? fcmToken = await FCMTokenService.getFCMToken();
    print('🔑 FCM Token for login: $fcmToken');
    
    final result = await _apiService.userLogin(phone);
    setState(() => isLoading = false);
    
    if(result["status"]==true || result["success"]==true){
      Fluttertoast.showToast(msg: "Otp Sent Successfully");
      Navigator.pushNamedAndRemoveUntil(context, "/OtpScreen", arguments: phone, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImage.AppBgImage, fit: BoxFit.cover),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BuildHeader(title: "Login"),
          ),
          Positioned.fill(top: topPadding + 75, bottom: 120, child: _body()),
          _bottomButton(),
        ],
      ),
    );
  }

  Widget _body() => SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text("Phone Number", style: AppTextStyle.semiBold17black),
        const SizedBox(height: 10),
        _phoneField(),
        const SizedBox(height: 18),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/RegisterScreen"),
          child: Text(
            "New User? Register",
            style: TextStyle(color: AppColors.PrimaryColor),
          ),
        ),
      ],
    ),
  );

  Widget _phoneField() => Container(
    height: 55,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.borderColor),
    ),
    child: Row(
      children: [
        Image.asset(AppIconImg.Indflag, height: 30),
        SizedBox(width: 4),
        Text("+91"),
        SizedBox(width: 4),
        Container(height: 40, width: 1.5, color: AppColors.PrimaryColor),
        SizedBox(width: 6),
        Expanded(
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
          ),
        ),
      ],
    ),
  );

  Widget _bottomButton() => Positioned(
    left: 20,
    right: 20,
    bottom: 28,
    child: InkWell(
      onTap: isLoading ? null : _login,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.PrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
              : Text("Continue", style: AppTextStyle.semiBold17White),
        ),
      ),
    ),
  );
}