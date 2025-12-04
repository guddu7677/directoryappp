import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class JobBoardDetailsPage extends StatefulWidget {
  const JobBoardDetailsPage({super.key});

  @override
  State<JobBoardDetailsPage> createState() => _JobBoardDetailsPageState();
}

class _JobBoardDetailsPageState extends State<JobBoardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(
        title: "Job",
        trailing: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: AppColors.PrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              Icons.bookmark_add_outlined,
              color: AppColors.PrimaryColor,
            ),
          ),
        ),
      ),

      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImage.profileBG,
                      height: 270,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppImage.logoImg, height: 80, width: 80),
                          SizedBox(width: 12),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Job Title",
                                  style: AppTextStyle.semiBold22black,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Company Name",
                                  style: AppTextStyle.normal17black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    _buildSection(
                      title: "Description",
                      content:
                          "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                          "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.",
                    ),

                    _buildSection(title: "Salary", content: "00,000 - 00,000"),

                    _buildSection(title: "Experience", content: "1 - 3 Years"),

                    _buildSection(
                      title: "Address",
                      content:
                          "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.\n"
                          "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.",
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.semiBold17black),
          SizedBox(height: 10),
          Text(content, style: AppTextStyle.normal15black),
        ],
      ),
    );
  }
}
