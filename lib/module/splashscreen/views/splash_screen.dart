import 'dart:async';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/module/authentication/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

  Timer(Duration(seconds: 3), () {
  Provider.of<AuthNavigationProvider>(context, listen: false)
      .navigateTo("/OnboardingScreen");
});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              AppImage.AppBgImage,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Image.asset(
              AppImage.splashImg,
              fit: BoxFit.contain,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LOGO",
                    style: AppTextStyle.semiBold22black,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("L", style: AppTextStyle.rgular13Black),
                      const SizedBox(width: 6),
                      Text("o", style: AppTextStyle.rgular13Black),
                      const SizedBox(width: 6),
                      Text("g", style: AppTextStyle.rgular13Black),
                      const SizedBox(width: 6),
                      Text("o", style: AppTextStyle.rgular13Black),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
