import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  final ApiService _apiService = ApiService();
  
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void _onContinue() async {
    final phone = phoneController.text.trim();
    if (phone.isEmpty || phone.length != 10) {
      Fluttertoast.showToast(msg: "Please enter valid 10 digit phone number");
      return;  
    }
    setState(() => isLoading = true);
    final result = await _apiService.userSignup(phone);
    setState(() => isLoading = false);
    
    if (result["status"] == true) {
      Fluttertoast.showToast(msg: "OTP Sent Successfully");
      Navigator.pushNamedAndRemoveUntil(
        context, 
        "/OtpScreen", 
        arguments: {"phone": phone, "isLogin": false}, 
        (route) => false
      );
    } else if (result["message"] != null && 
               result["message"].toString().toLowerCase().contains("already")) {
      Fluttertoast.showToast(
        msg: "User already registered. Please login instead.",
      );
      Navigator.pushReplacementNamed(context, "/LoginScreen");
    } else {
      Fluttertoast.showToast(
        msg: result["message"] ?? "Registration failed. Please try again."
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

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
            child: BuildHeader(title: "Verify Your Phone Number"),
          ),
          Positioned.fill(
            top: topPadding + 75,
            bottom: 120,
            child: _buildBodyContent(),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get started with your phone number",
            style: AppTextStyle.semiBold17black,
          ),
          const SizedBox(height: 6),
          const Text(
            "Please enter your mobile number to continue.",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 24),
          Text("Phone Number", style: AppTextStyle.semiBold17black),
          const SizedBox(height: 10),
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderColor),
              color: Colors.white.withOpacity(0.9),
            ),
            child: Row(
              children: [
                Image.asset(AppIconImg.Indflag, height: 30, width: 41),
                const SizedBox(width: 4),
                Text("+91"),
                SizedBox(width: 4),
                Container(
                  height: 40,
                  width: 1.5,
                  color: AppColors.PrimaryColor,
                ),
                SizedBox(width: 6),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter phone number",
                      counterText: "",
                    ),
                    style: AppTextStyle.black16B2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 28,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: isLoading ? null : _onContinue,
              child: isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text("Continue", style: AppTextStyle.semiBold17White),
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text: "By continuing, you agree to our ",
              children: [
                TextSpan(
                  text: "Terms and Conditions",
                  style: TextStyle(
                    color: AppColors.PrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: "."),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}