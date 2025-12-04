import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notificationData = [
    {
      "image": "assets/svg/noti.png",
      "message": "Lorem Ipsum Lorem Ipsum Lorem Ipsum.",
      "time": "2m"
    },
    {
      "image": "assets/svg/notifi.png",
      "message": "Your profile has been updated successfully.",
      "time": "5m"
    },
    {
      "image": "assets/svg/notifi.png",
      "message": "New job posted matching your skills.",
      "time": "12m"
    },
    {
      "image": "assets/svg/notifi.png",
      "message": "Your resume was viewed by Recruiter.",
      "time": "20m"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: BuildHeader(title: "Notification"),
      body: Column(
        children: [

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: notificationData.length,
              separatorBuilder: (_, __) => const Padding(
                padding: EdgeInsets.only(left: 60),
                child: Divider(),
              ),
              itemBuilder: (context, index) {
                final item = notificationData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _notificationCard(
                      image: item["image"]!,
                      message: item["message"]!,
                      time: item["time"]!,
                    ),
                   SizedBox(height: 16),
                    _unreadCard(subMessage: item["message"]!),
                   SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationCard({
    required String image,
    required String message,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),

       SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: AppTextStyle.normal15black,
          ),
        ),

       SizedBox(width: 8),
        Text(
          time,
          style: AppTextStyle.normal12black,
        ),
      ],
    );
  }

  Widget _unreadCard({required String subMessage}) {
    return Padding(
      padding: EdgeInsets.only(left: 60, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 7,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.PrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
         SizedBox(width: 12),
          Expanded(
            child: Text(
              subMessage,
              style: AppTextStyle.normal12black,
            ),
          ),
        ],
      ),
    );
  }
}
