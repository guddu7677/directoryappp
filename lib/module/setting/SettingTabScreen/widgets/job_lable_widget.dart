import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';

class BottomlableContainer extends StatelessWidget {
  final String label;
  final IconData icon;

  const BottomlableContainer({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 110,
      decoration: BoxDecoration(
        color: AppColors.PrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(14),
          topLeft: Radius.circular(10),
        ),
        border: Border(
          top: BorderSide(color: AppColors.borderColor),
          left: BorderSide(color: AppColors.borderColor),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: AppTextStyle.rgular13Black),
          SizedBox(width: 6),
          Icon(icon, size: 18, color: AppColors.PrimaryColor),
        ],
      ),
    );
  }
}
