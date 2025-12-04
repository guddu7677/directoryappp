import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class historyCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String date;
  final String amaount;

  const historyCard({
     this.title,
     this.subtitle,
    required this.date,
    required this.amaount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name of subscription", style: AppTextStyle.normal14black),
                SizedBox(height: 4),
                Text("Trabsaction ID", style: AppTextStyle.normal12black),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date, style: AppTextStyle.normal12black),
                Text(
                 amaount,
                  style: TextStyle(
                    color: AppColors.PrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
