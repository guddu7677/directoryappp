
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/widgets/paymet_history_widget.dart';
import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(title: "Payment History"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 175,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(AppImage.payhistoryimg),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Image.asset(AppImage.historyimg),
                    ),
                    Positioned(
                      top: 32,
                      left: 12,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Payment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "History",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              historyCard(
              date: "11.12.2021",
              amaount: "Rs. 150.00",
              ),
                SizedBox(height: 16),
              historyCard(
              date: "11.11.2022",
              amaount: "Rs. 333.00",

              ),
                SizedBox(height: 16),
              historyCard(
              date: "21.12.2023",
              amaount: "Rs. 1230.00",

              ),
                SizedBox(height: 16),
              historyCard(
              date: "11.02.2020",
              amaount: "Rs. 3000.00",

              ),
                SizedBox(height: 16),
              historyCard(
              date: "11.08.2025",
              amaount: "Rs. 8950.00",

              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
