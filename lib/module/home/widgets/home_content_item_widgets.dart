import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';
class HomeContentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String profile;
  final double rating;

  const HomeContentItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.profile,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyle.semiBold20black),
                     SizedBox(height: 4),
                    Text(subtitle, style: AppTextStyle.semiBold14black),
                  ],
                ),
              ),

              Row(
                children: [
                  Icon(Icons.star, color: AppColors.PrimaryColor, size: 16),
                   SizedBox(width: 4),
                  Text("Ratings: $rating", style: AppTextStyle.rgular13Black),
                ],
              ),
            ],
          ),
        ),

         SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: AssetImage(image           
              ),
              fit: BoxFit.cover
              )
            ),
          
          ),
        ),
       SizedBox(height: 16),
      ],
    );
  }
}

