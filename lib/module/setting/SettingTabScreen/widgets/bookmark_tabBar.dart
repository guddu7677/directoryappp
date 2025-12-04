import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';
class BookmarkTabbar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String profile;
  final IconData? icon;

  const BookmarkTabbar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.profile,
     this.icon,
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
                height: 54,
                width: 54,
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

               Container(height: 32,
               width: 32,
               decoration: BoxDecoration(color: AppColors.PrimaryColor,borderRadius: BorderRadius.circular(8)),
               child: Icon(Icons.bookmark_remove_outlined,color: Colors.white,),
               )
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

