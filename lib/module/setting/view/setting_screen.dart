import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:directoryapp/module/setting/widgets/setting_widget.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notificationValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(
       onBack: () {
    Provider.of<NavigationProvider>(context, listen: false).setIndex(0);
     },
        title: "Profile",
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 260,
                        width: double.infinity,
                        color: const Color(0xFFF57E00).withOpacity(0.2),
                        child: Image.asset(
                          AppImage.AppBgImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.PrimaryColor,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipOval(
                            child: Image.asset(
                              AppImage.Profile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 90,
                        right: 0,
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: AppColors.PrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.mode_edit_outline_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/PersonalInformation",
                            );
                          },
                          child: settingTab(
                            text: "Personal Information",
                            icon: Icons.person_4_outlined,
                          ),
                        ),
                        SizedBox(height: 16),
                        settingTab(
                          text: "Notification",
                          icon: Icons.notifications_none_outlined,
                          tralling: Switch(
                            value: notificationValue,
                            activeTrackColor: AppColors.PrimaryColor,
                            inactiveTrackColor: Colors.grey.shade300,
                            onChanged: (value) {
                              setState(() {
                                notificationValue = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/BookmarkScreen");
                          },
                          child: settingTab(
                            text: "Bookmark",
                            icon: Icons.bookmark_outline,
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/SubscriptionScreen");
                          },
                          child: settingTab(
                            text: "Subscription",
                            icon: Icons.check_circle_outline,
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/RatingScreen");
                          },
                          child: settingTab(
                            text: "Rating",
                            icon: Icons.star_border_outlined,
                            tralling: Row(
                              children: [
                                Icon(Icons.star, color: AppColors.PrimaryColor),
                                SizedBox(height: 4),
                                Text("4.8"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/PaymentHistoryScreen",
                            );
                          },
                          child: settingTab(
                            text: "Payment History",

                            icon: Icons.payment_outlined,
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/HelpSupportScreen");
                          },
                          child: settingTab(
                            text: "Help & Support",
                            icon: Icons.help_outline,
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/AboutUsScreen");
                          },
                          child: settingTab(
                            text: "About Us",
                            icon: Icons.info_outline,
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/PrivacyPolicyScreen",
                            );
                          },
                          child: settingTab(
                            text: "Privacy Policy",
                            icon: Icons.lock_clock_outlined,
                          ),
                        ),

                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/TermConditions");
                          },
                          child: settingTab(
                            text: "Term & Conditions",
                            icon: Icons.rule_outlined,
                          ),
                        ),
                        SizedBox(height: 16),
                        settingTab(
                          text: "Log Out",
                          icon: Icons.bookmark_outline,
                        ),
                      ],
                    ),
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
