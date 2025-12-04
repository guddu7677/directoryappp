import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
appBar: BuildHeader(title: "Privecy Policy"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Privacy Matters",
                     style: AppTextStyle.Bold20black,
                      textAlign: TextAlign.start,
                  ),

                  const SizedBox(height: 12),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable "
                    "content of a page when looking at its layout.",
                    style: AppTextStyle.normal17black,
                    textAlign: TextAlign.start,
                  ),

                   SizedBox(height: 8),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable "
                    "content of a page when looking at its layout.",
                    style: AppTextStyle.normal17black,
                    textAlign: TextAlign.start,
                  ),

                   SizedBox(height: 20),
                  Text("Introduction", style: AppTextStyle.Bold20black),

                   SizedBox(height: 16),
                  Container(
                    padding:  EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppColors.PrimaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lorem Ipsum", style: AppTextStyle.Bold20white),
                        const SizedBox(height: 16),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                          style: AppTextStyle.normal20White,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                 SizedBox(height: 20),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable "
                    "content of a page when looking at its layout.",
                    style: AppTextStyle.normal17black,
                    textAlign: TextAlign.start,
                  ),
                   SizedBox(height: 8),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable "
                    "content of a page when looking at its layout.",
                    style: AppTextStyle.normal17black,
                    textAlign: TextAlign.start,
                  ),

                   SizedBox(height: 20),
                  Text("Introduction", style: AppTextStyle.Bold20black),
                 SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppColors.PrimaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lorem Ipsum", style: AppTextStyle.Bold20white),
                        const SizedBox(height: 16),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                          style: AppTextStyle.normal20White,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "It is a long established fact that a reader will be distracted by the readable "
                    "content of a page when looking at its layout.",
                    style: AppTextStyle.normal17black,
                    textAlign: TextAlign.start,
                  ),

                   SizedBox(height: 8),

                  Text(
                    "It is a long established fact that a reader will be distracted by the readable "
                    "content of a page when looking at its layout.",
                    style: AppTextStyle.normal17black,
                    textAlign: TextAlign.start,
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
