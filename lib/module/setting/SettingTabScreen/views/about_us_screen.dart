import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(title: "About Us"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImage.aboutUsimg,
                    height: 225,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "About Us",
                      style: AppTextStyle.Bold20black,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Lorim Ipsum Lorim Ipsum lorim Ipsum Lorim "
                      "Lorim Ipsum Lori Ipsum lorim Ipsum Lorim.",
                      style: AppTextStyle.normal17black,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Our Purpose",
                      style: AppTextStyle.Bold20black,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "It is a long established fact that a reader will be distracted by the readable "
                      "content of a page when looking at its layout.",
                      style: AppTextStyle.normal17black,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    color: AppColors.PrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lorim Ipsum", style: AppTextStyle.Bold20white),
                        const SizedBox(height: 16),

                        Container(
                          height: 270,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lorim Ipsum", style: AppTextStyle.Bold20black),
                              const SizedBox(height: 16),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                                style: AppTextStyle.normal20black,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text("Lorim Ipsum", style: AppTextStyle.Bold20white),
                        const SizedBox(height: 16),

                        Container(
                          height: 270,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lorim Ipsum", style: AppTextStyle.Bold20black),
                              const SizedBox(height: 16),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                                style: AppTextStyle.normal20black,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Our Approach",
                      style: AppTextStyle.Bold20black,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content.",
                      style: AppTextStyle.normal20black,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 55,
                      width: 155,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.PrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Learn more", style: AppTextStyle.semi22White),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
