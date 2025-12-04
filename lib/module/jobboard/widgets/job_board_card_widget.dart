import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';

class JobBoardCardWidget extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String salaryRange;
  final String location;

  const JobBoardCardWidget({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.salaryRange,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
     borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12)),

        color: Colors.white,
        border: Border.all(color: Color(0x4D8C944D)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(jobTitle, style: AppTextStyle.semiBold14black),
           SizedBox(height: 12),
          Divider(color: AppColors.borderColor),

           SizedBox(height: 12),

          _infoRow(icon: Icons.business, text: companyName),
           SizedBox(height: 10),

          _infoRow(icon: Icons.money, text: salaryRange),
           SizedBox(height: 10),

          _infoRow(icon: Icons.location_on_outlined, text: location),
        ],
      ),
    );
  }

  Widget _infoRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            color: const Color(0xFFEDF6FC),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 16, color: AppColors.PrimaryColor),
        ),
         SizedBox(width: 10),
        Expanded(child: Text(text, style: AppTextStyle.normal15black)),
      ],
    );
  }
}
