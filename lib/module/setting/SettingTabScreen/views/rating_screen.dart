
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/widgets/rating_widget.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(title: "Rating"),
      body: Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                children: [
                  Image.asset(AppImage.ratingpageimg),
                 SizedBox(height: 20),
                  RatingCardWidget(
                    image: AppImage.Profile,
                    name: "Lorim ipsum name",
                    rating: 4,
                    review:
                        "Lorim Ipsum Lorim Ipsum Lorim Ipsum Lorim Ipsum "
                        "Lorim Ipsum Lorim Ipsum Lorim Ipsum",
                  ),

                 SizedBox(height: 8),
                  RatingCardWidget(
                    image: AppImage.homeprofileImg,
                    name: "Lorim iphdahjdsksum name",
                    rating: 3,
                    review:
                        "Lorim Ipsum sfdlksflks Ipsum Lorim Ipsum Lorim Ipsum "
                        "Lorim Ipsum Lorim Ipsum Lorim Ipsum",
                  ),

                 SizedBox(height: 8),
                  RatingCardWidget(
                    image: AppImage.homeprofileImg,
                    name: "kflnlnkf iphdahjdsksum name",
                    rating: 2,
                    review:
                        "Lorim Ipsum sfdlksflks Ipsum ;fnksfklf Ipsum Lorim Ipsum "
                        "Lorim Ipsum Lorim Ipsum Lorim Ipsum",
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
