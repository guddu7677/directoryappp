import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": AppImage.firstsplashImg,
      "title": "BE BETTER",
      "subtitle":
          "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum lorimm ipsum",
    },
    {
      "image": AppImage.secondtsplashImg,
      "title": "FIND FASTER",
      "subtitle":
          "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum lorimm ipsum",
    },
    {
      "image": AppImage.thirdtsplashImg,
      "title": "FIND FASTER",
      "subtitle":
          "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum lorimm ipsum",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.PrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: Image.asset(
                            data["image"],
                            fit: BoxFit.contain,
                          ),
                        ),
                         SizedBox(height: 20),
                        Text(data["title"], style: AppTextStyle.semiBold22black),
                         SizedBox(height: 8),
                        Text(
                          data["subtitle"],
                          textAlign: TextAlign.center,
                          style: AppTextStyle.semiBold17black,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: currentIndex == index ? 30 : 10,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.PrimaryColor
                        : AppColors.PrimaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: UniversalButton(
                      title: "Register",
                      textColor: AppColors.PrimaryColor,
                      onTap: () {
                        Navigator.pushNamed(context, "/RegisterScreen");
                      },
                      borderColor: AppColors.borderColor,
                    ),
                  ),

                  const SizedBox(width: 16),
                  Expanded(
                    child: UniversalButton(
                      title: "Log in",
                      textColor: Colors.white,
                      onTap: () {
                     Navigator.pushNamed(context, "/LoginScreen");

                      },
                      bgColor: AppColors.PrimaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
