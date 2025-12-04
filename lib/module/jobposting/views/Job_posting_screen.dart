import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:directoryapp/module/jobposting/widgets/build_jobcard_widgets.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/widgets/job_lable_widget.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  State<JobPostingScreen> createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  final List<Map<String, dynamic>> jobList = [
    {
      "companyShortName": "UBER",
      "companyName": "Uber Technologies Inc.",
      "salaryRange": "10,000 - 15,000",
      "location": "California, USA",
      "description":
          "It is a long established fact that a reader will be distracted...",
      "label": "Added",
      "icon": Icons.bookmark_border_outlined,
      "isClickable": true,
    },
    {
      "companyShortName": "GOOG",
      "companyName": "Google LLC",
      "salaryRange": "20,000 - 35,000",
      "location": "Mountain View, USA",
      "description":
          "Point of using Lorem Ipsum is that it has a normal distribution...",
      "label": "Saved",
      "icon": Icons.bookmark_added_rounded,
      "isClickable": false,
    },
    {
      "companyShortName": "Nawal",
      "companyName": "Vertex",
      "salaryRange": "15,000 - 45,000",
      "location": "Patna (Bihar)",
      "description":
          "Point of using Lorem Ipsum is that it has a normal distribution...",
      "label": "Saved",
      "icon": Icons.bookmark_added_rounded,
      "isClickable": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: BuildHeader(
       onBack: () {
    Provider.of<NavigationProvider>(context, listen: false).setIndex(0);
  },
        title: "Job Postings",
        trailing: Container(
          height: 30,
          width: 30,
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        child: ListView.separated(
          itemCount: jobList.length,
          separatorBuilder: (_, __) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = jobList[index];

            final card = JobCard(
              companyShortName: item["companyShortName"],
              companyName: item["companyName"],
              salaryRange: item["salaryRange"],
              location: item["location"],
              description: item["description"],
              bottomlablewidget: BottomlableContainer(
                label: item["label"],
                icon: item["icon"],
              ),
            );

            return item["isClickable"]
                ? InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/AddJobScreen");
                    },
                    child: card,
                  )
                : card;
          },
        ),
      ),
    );
  }
}
