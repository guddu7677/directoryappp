import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/widgets/bookmark_tabBar.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
         appBar: BuildHeader(title: "Bookmark"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              dividerColor: Colors.transparent,
              labelColor: AppColors.PrimaryColor,
              unselectedLabelColor: Colors.black,
              labelStyle: AppTextStyle.semiBold17black,
              indicatorColor: AppColors.PrimaryColor,
              indicatorWeight: 3,
              labelPadding: EdgeInsets.symmetric(horizontal: 30),
              tabs: [
                Tab(text: "Saved Businesses"),
                Tab(text: "Saved Jobs"),
              ],
            ),
          ),
         SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      BookmarkTabbar(
                        title: "Standered Kulfi",
                        subtitle: "Industry",
                        image: AppImage.homeImg,
                        profile: AppImage.homeprofileImg,
                      ),
                      BookmarkTabbar(
                        title: "Dkns Kulfi",
                        subtitle: "Inddnsjustry",
                        image: AppImage.homeImg,
                        profile: AppImage.homeprofileImg,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "No saved jobs",
                    style: AppTextStyle.normal14black,
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
