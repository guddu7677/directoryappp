
import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart' show AppTextStyle;
import 'package:directoryapp/module/setting/SettingTabScreen/widgets/info_row_widget.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String companyShortName;
  final String companyName;
  final String salaryRange;
  final String location;
  final String description;
  final Widget bottomlablewidget;

  const JobCard({
    super.key,
    required this.companyShortName,
    required this.companyName,
    required this.salaryRange,
    required this.location,
    required this.description,
    required this.bottomlablewidget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Center(
                      child: Text(
                        companyShortName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoRow(icon: Icons.business_center_rounded, text: companyName),
                       SizedBox(height: 10),
                        InfoRow(icon: Icons.payments_rounded, text: salaryRange),
                       SizedBox(height: 10),
                        InfoRow(icon: Icons.location_on_outlined, text: location),
                      ],
                    ),
                  ),
                ],
              ),

             SizedBox(height: 12),
              Text("Description", style: AppTextStyle.semiBold14black),
             SizedBox(height: 6),
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.rgular13Black,
              ),
            ],
          ),
        ),

        Positioned(bottom: 0, right: 0, child: bottomlablewidget),
      ],
    );
  }
}