import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';

class settingTab extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? tralling;
  const settingTab({
    required this.icon,
    required this.text,
    this.tralling,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFEDF6FC),
                  ),
                  child: Center(
                    child: Icon(icon,color: AppColors.PrimaryColor,),
                  ),
                ),
                SizedBox(width: 16),
                Text(text, style: AppTextStyle.normal17black),
              ],
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(color: Colors.white),
              child: tralling,
            )
          ],
        ),
      ),
    );
  }
}
