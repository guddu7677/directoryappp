import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:directoryapp/module/home/widgets/home_content_item_widgets.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Lorim ipsum name",
      "subtitle": "Lorim ipsum subtitle",
      "image": AppImage.homeImg,
      "profile": AppImage.homeprofileImg,
      "rating": 4.8,
    },
    {
      "title": "Lorim ipsum name",
      "subtitle": "Lorim ipsum subtitle",
      "image": AppImage.homeImg,
      "profile": AppImage.homeprofileImg,
      "rating": 4.8,
    },
    {
      "title": "Lorim ipsum name",
      "subtitle": "Lorim ipsum subtitle",
      "image": AppImage.homeImg,
      "profile": AppImage.homeprofileImg,
      "rating": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: SizedBox(height: 20),
        ),

        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage(AppImage.appBarimg),
          ),
        ),

        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("LORIM IPSUM NAME", style: AppTextStyle.semiBold20White),
            const SizedBox(height: 2),
            Text("Industry", style: AppTextStyle.semiBold14White),
          ],
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "/NotificationScreen"),
              child: Container(
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.PrimaryColor,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
           SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: UniversalTextField(
                    hintText: "Search...",
                    suffixIcon: Icon(Icons.search_outlined, color: Colors.grey),
                  ),
                ),
               SizedBox(width: 12),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/SearchfilterScreen"),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppIconImg.homeconIcon),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index];

                return InkWell(
                  onTap: () => Navigator.pushNamed(context, "/HomeItemDetails"),
                  child: HomeContentItem(
                    title: data["title"],
                    subtitle: data["subtitle"],
                    image: data["image"],
                    profile: data["profile"],
                    rating: data["rating"],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
