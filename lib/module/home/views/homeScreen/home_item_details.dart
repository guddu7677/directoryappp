import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class HomeItemDetails extends StatefulWidget {
  const HomeItemDetails({super.key});

  @override
  State<HomeItemDetails> createState() => _HomeItemDetailsState();
}

class _HomeItemDetailsState extends State<HomeItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: BuildHeader(
            title: "Name",
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UniversalButton(title: "Tap here to rate profile", textColor: Colors.white, onTap: (){},bgColor: AppColors.PrimaryColor,),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(AppImage.homeImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImage.homeprofileImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lorim Ipsum Name",
                              style: AppTextStyle.semiBold20black,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Industry",
                              style: AppTextStyle.semiBold14black,
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.PrimaryColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Ratings: 4.5",
                            style: AppTextStyle.rgular13Black,
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF6FC),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.location_history_outlined,
                          color: AppColors.PrimaryColor,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "900+ user contacted",
                        style: AppTextStyle.normal15black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF6FC),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.business_rounded,
                          color: AppColors.PrimaryColor,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Business Services",
                        style: AppTextStyle.normal15black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDF6FC),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.PrimaryColor,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "City, State, Pincode",
                        style: AppTextStyle.normal15black,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Lorim ipsum lorim ipsum",
                        style: AppTextStyle.normal15black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Lorim ipsum lorim ipsum",
                        style: AppTextStyle.normal15black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Lorim ipsum lorim ipsum Lorim ipsum lorim ipsum",
                          style: AppTextStyle.normal15black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Lorim ipsum lorim ipsum Lorim ipsum lorim ipsumLorim ipsum lorim ipsum.",
                          style: AppTextStyle.normal15black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: AppColors.PrimaryColor,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "000000000",
                              style: AppTextStyle.semiBold17black,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: AppColors.PrimaryColor,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Supportservice@gmail.com",
                              style: AppTextStyle.semiBold17black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
