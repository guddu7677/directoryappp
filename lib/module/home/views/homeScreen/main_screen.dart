import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/module/home/model/navigation_item.model.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:directoryapp/module/home/views/homeScreen/home_screen.dart';
import 'package:directoryapp/module/jobboard/view/Job_board_screen.dart';
import 'package:directoryapp/module/jobposting/views/Job_posting_screen.dart';
import 'package:directoryapp/module/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const List<NavigationItem> _navigationItems = [
    NavigationItem(icon: AppIconImg.jobPostingImg, label: "HOME", index: 0),
    NavigationItem(icon: AppIconImg.jobBoardImg, label: "JOB BOARD", index: 1),
    NavigationItem(
      icon: AppIconImg.jobPostingImg,
      label: "JOB POSTING",
      index: 2,
    ),
    NavigationItem(icon: AppIconImg.settingIcon, label: "SETTINGS", index: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final provider = context.read<NavigationProvider>();
        if (provider.selectedIndex != 0) {
          provider.resetToHome();
          return false;
        }
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body:  _MainScreenBody(),
        bottomNavigationBar: _MainBottomNavigationBar(),
      ),
    );
  }
}

class _MainScreenBody extends StatelessWidget {
  const _MainScreenBody();

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<NavigationProvider, int>(
      (provider) => provider.selectedIndex,
    );

    final List<Widget> pages = [
      const HomeScreen(),
      const Jobboardscreen(),
      const JobPostingScreen(),
      const SettingScreen(),
    ];

    return IndexedStack(index: selectedIndex, children: pages);
  }
}

class _MainBottomNavigationBar extends StatelessWidget {
  const _MainBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.PrimaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: navigationProvider.selectedIndex,
          onTap: (index) => navigationProvider.setIndex(index),
          elevation: 0,
          showUnselectedLabels: true,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          iconSize: 24,
          items: MainScreen._navigationItems
              .map(
                (item) => _buildNavigationBarItem(
                  item,
                  navigationProvider.selectedIndex == item.index,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
    NavigationItem item,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Image.asset(
          item.icon,
          height: 20,
          width: 20,
          color: isSelected ? null : Colors.grey,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Image.asset(
          item.icon,
          height: 20,
          width: 20,
          color: AppColors.PrimaryColor,
        ),
      ),
      label: item.label,
    );
  }
}
