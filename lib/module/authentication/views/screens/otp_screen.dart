import 'dart:async';
import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/module/authentication/provider/auth_provider.dart';
import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;
  final bool isLogin;

  const OtpScreen({super.key, required this.mobile, this.isLogin = true});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isloading = false;
  Timer? _timer;
  int _resendTimer = 30;
  late bool _isLogin;
  late String phone;

  @override
  void initState() {
    super.initState();
    phone = widget.mobile;
    _isLogin = widget.isLogin;
    print("OTP Screen - Phone: $phone, IsLogin: $_isLogin");
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel();
    _resendTimer = 30;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_resendTimer > 0) {
        setState(() => _resendTimer--);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> resendOtp() async {
    if (_resendTimer > 0) return;

    setState(() => _isloading = true);

    final result = _isLogin
        ? await _apiService.userLogin(phone)
        : await _apiService.userSignup(phone);

    if (!mounted) return;

    setState(() => _isloading = false);

    if (result["status"] == true) {
      otpController.clear();
      startTimer();
      Fluttertoast.showToast(msg: "OTP sent successfully");
    } else {
      Fluttertoast.showToast(msg: result["message"] ?? "Failed to resend OTP");
    }
  }

  Future<void> handleContinue() async {
    if (otpController.text.length != 4) {
      Fluttertoast.showToast(msg: "Please enter 4 digit code");
      return;
    }

    setState(() => _isloading = true);
    print("Verifying OTP for: $phone");

    final result = await _apiService.verifyOtp(phone, otpController.text);

    if (!mounted) return;

    setState(() => _isloading = false);

   if (result["status"] == true) {
  Fluttertoast.showToast(msg: "OTP verified successfully");

  _timer?.cancel();

  Provider.of<NavigationProvider>(
    context,
    listen: false,
  ).resetToHome();

  Provider.of<AuthProvider>(
    context,
    listen: false,
  ).loginSuccess();
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
            child: BuildHeader(title: "OTP"),
          ),
          Positioned.fill(top: topPadding + 75, child: _buildBodyContent()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: _isloading ? null : handleContinue,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.PrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: _isloading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Continue", style: AppTextStyle.semiBold17White),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "By continuing you agree to our ",
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: AppColors.PrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: "."),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter OTP", style: AppTextStyle.semiBold17black),
          SizedBox(height: 6),
          Text(
            "Please enter the OTP sent to your mobile number ($phone).",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 24),
          Text("OTP", style: AppTextStyle.semiBold17black),
          SizedBox(height: 10),
          Center(
            child: Pinput(
              controller: otpController,
              length: 4,
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                textStyle: AppTextStyle.semiBold17black,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.PrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: InkWell(
              onTap: _resendTimer <= 0 && !_isloading ? resendOtp : null,
              child: _resendTimer <= 0
                  ? Text(
                      _isloading ? "Sending..." : "Resend OTP",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.PrimaryColor,
                      ),
                    )
                  : Text(
                      "Resend OTP in $_resendTimer sec",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
