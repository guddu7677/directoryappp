import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:directoryapp/module/jobboard/widgets/job_board_card_widget.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Jobboardscreen extends StatefulWidget {
  const Jobboardscreen({super.key});

  @override
  State<Jobboardscreen> createState() => _JobboardscreenState();
}

class _JobboardscreenState extends State<Jobboardscreen> {
  final List<Map<String, dynamic>> jobbordList = [
    {
      "jobTitle": "UBER",
      "companyName": "Uber Technologies Inc.",
      "salaryRange": "10,000 - 15,000",
      "location": "California, USA",
      "isClickable": true,
    },
    {
      "jobTitle": "GOOG",
      "companyName": "Google LLC",
      "salaryRange": "20,000 - 35,000",
      "location": "Mountain View, USA",
      "isClickable": false,
    },
    {
      "jobTitle": "Nawal",
      "companyName": "Vertex",
      "salaryRange": "15,000 - 45,000",
      "location": "Patna (Bihar)",
      "isClickable": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          BuildHeader(
            onBack: () {
              Provider.of<NavigationProvider>(
                context,
                listen: false,
              ).setIndex(0);
            },
            title: "Job Board",
            trailing: InkWell(
              onTap: () => Navigator.pushNamed(context, "/AddJobScreen"),
              child: Icon(Icons.add, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: UniversalTextField(
              hintText: "Search...",
              suffixIcon: Icon(Icons.search),
            ),
          ),

          SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: jobbordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = jobbordList[index];

                final card = JobBoardCardWidget(
                  jobTitle: item["jobTitle"],
                  companyName: item["companyName"],
                  salaryRange: item["salaryRange"],
                  location: item["location"],
                );

                return item["isClickable"]
                    ? InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/JobBoardDetailsPage");
                        },
                        child: card,
                      )
                    : card;
              },
            ),
          ),
        ],
      ),
    );
  }
}
