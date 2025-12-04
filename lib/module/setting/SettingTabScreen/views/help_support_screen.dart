import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final List<Map<String, String>> faqList = [
    {
      "question": "Lorim Ipsum Lorim Ipsum?",
      "answer":
          "This is the detailed answer for Lorim Ipsum Lorim Ipsum. You can replace it with real content.",
    },
    {
      "question": "Lorim Ipsum xk Ipsum?",
      "answer": "This is the detailed answer for Lorim Ipsum xk Ipsum.",
    },
    {
      "question": "Lorim fdlkv Lorim Ipsum?",
      "answer": "This is the detailed answer for Lorim fdlkv Lorim Ipsum.",
    },
    {
      "question": "Lorim lfon Lorim Ipsum?",
      "answer": "This is the detailed answer for Lorim lfon Lorim Ipsum.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(title: "Help & Support"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Frequently Asked Question’s",
                    style: AppTextStyle.Bold20black,
                      textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: faqList.length,
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (context, index) {
                        return Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            childrenPadding: EdgeInsets.only(
                              left: 4,
                              right: 4,
                              bottom: 10,
                            ),
                            leading: Icon(
                              Icons.help_outline,
                              color: AppColors.PrimaryColor,
                            ),
                            title: Text(
                              faqList[index]["question"]!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            iconColor: AppColors.PrimaryColor,
                            collapsedIconColor: AppColors.PrimaryColor,
                            children: [
                              Text(
                                faqList[index]["answer"]!,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Get Help",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  _supportCard(
                    icon: Icons.phone,
                    title: "Our 24×7 Customer Service",
                    subtitle: "+91 5246 635 535",
                  ),
                  SizedBox(height: 16),
                  _supportCard(
                    icon: Icons.email_outlined,
                    title: "Write Us at",
                    subtitle: "Supportservice@gmail.com",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _supportCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.PrimaryColor,
      ),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(icon, color: AppColors.PrimaryColor, size: 18),
          ),
         SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
