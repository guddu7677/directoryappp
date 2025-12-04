import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
appBar: BuildHeader(title: "Subscription"),
      body: Stack(
        children: [
          Positioned(
            right: 10,
            left: 220,
            top: 10,
            child: Image.asset(AppIconImg.sbscribeImg),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 16),

                      _buildTitle(),
                       SizedBox(height: 10),

                      _buildSubtitle(),
                       SizedBox(height: 18),

                      _buildBenefitList(),
                       SizedBox(height: 22),

                      Text(
                        "Select a plan for your free trial.",
                        style: AppTextStyle.semiBold17black,
                      ),

                       SizedBox(height: 18),

                      _buildPlanOptions(width),
                       SizedBox(height: 22),

                      _buildDotIndicator(),

                       SizedBox(height: 14),
                      Center(
                        child: Text(
                          "Lorim ipsum lorim ipsum lorim ipsum",
                          style: AppTextStyle.black16B2,
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: UniversalButton(
          title: "Subscribe",
          textColor: Colors.white,
          bgColor: AppColors.PrimaryColor,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Lorim Ipsum Lorim",
      style: AppTextStyle.semiBold22black,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Lorim Ipsum Lorim ipsum lorim ipsum lorum ipsum lorim Ipsum lorim Ipsum Lorim.",
      style: AppTextStyle.normal15black,
    );
  }

  Widget _buildBenefitList() {
    const benefits = [
      "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum.",
      "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum.",
      "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum.",
    ];

    return Column(
      children: benefits
          .map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _benefitRow("Lorim Ipsum :", b),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPlanOptions(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _subscriptionCard(
          index: 0,
          width: width * 0.43,
          title: "YEARLY",
          priceNow: "24,354 / YR",
          priceOld: "53,356 / YR",
          description: "Lorim Ipsum Lorim Ipsum.",
          showSavings: true,
        ),

        _subscriptionCard(
          index: 1,
          width: width * 0.43,
          title: "MONTHLY",
          priceNow: "2,150 / MO",
          priceOld: "3,000 / MO",
          description: "Lorim Ipsum Lorim Ipsum.",
        ),
      ],
    );
  }

  Widget _benefitRow(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppIconImg.kingimg, height: 22, width: 22),
        const SizedBox(width: 8),

        Text(title, style: AppTextStyle.semiBold17black),
        const SizedBox(width: 4),

        Expanded(
          child: Text(
            desc,
            style: AppTextStyle.normal15black,
          ),
        ),
      ],
    );
  }

  Widget _subscriptionCard({
    required int index,
    required double width,
    required String title,
    required String priceNow,
    required String priceOld,
    required String description,
    bool showSavings = false,
  }) {
    final isSelected = selectedPlan == index;

    return GestureDetector(
      onTap: () => setState(() => selectedPlan = index),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.PrimaryColor : Colors.grey.shade400,
                width: 1.6,
              ),
            ),
            child: Column(
              children: [
                Text(title, style: AppTextStyle.semiBold17black),
                const SizedBox(height: 10),

                Text(priceNow, style: AppTextStyle.semiBold17black),
                const SizedBox(height: 6),

                Text(priceOld, style: AppTextStyle.normal12black),
                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(description, style: AppTextStyle.normal15black),
                ),
              ],
            ),
          ),

          if (showSavings)
            Positioned(
              top: -13,
              left: 14,
              right: 14,
              child: Container(
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFF35C681),
                ),
                alignment: Alignment.center,
                child: Text(
                  "40% SAVINGS",
                  style: AppTextStyle.semiBold14White,
                ),
              ),
            ),

          Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.PrimaryColor : Colors.black,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.PrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot() {
    return Container(
      height: 6,
      width: 6,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.PrimaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (_) => _dot()),
    );
  }
}
