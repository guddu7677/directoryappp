import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:directoryapp/module/home/provider/home_provider.dart';
import 'package:directoryapp/module/jobboard/service/api_job_service.dart';
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
  final List<Map<String, dynamic>> jobbordList = [];
  final ApiJobService _api = ApiJobService();
  bool isLoading = false;

  String searchText = "";
  @override
  void initState() {
    super.initState();
    fetchjobBoard();
  }

 Future<void> fetchjobBoard() async {
  setState(() => isLoading = true);

  final response = await _api.fetchjobBoard(search: searchText);

  setState(() => isLoading = false);

  if (response["status"] == true && response["data"] != null) {
    final data = response["data"] as List;
    jobbordList.clear();

    for (var job in data) {
      jobbordList.add({
        "id": job["id"],
        "jobTitle": job["job_title"] ?? "No Title",
        "companyName": job["company_name"] ?? "Unknown Company",
        "salaryRange": "${job["min_salary"] ?? 0} - ${job["max_salary"] ?? 0}",
        "location": job["location"] ?? "No Location",
        "isClickable": true,
      });
    }

    setState(() {});
  }
}


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
              onTap: (){
                Navigator.pushNamed(context, "/AddJobScreen");
              },
              child: Icon(Icons.add, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: UniversalTextField(
              onchanged: (value) {
                searchText = value;
                fetchjobBoard();
              },
              hintText: "Search...",
              suffixIcon: Icon(Icons.search),
            ),
          ),

          SizedBox(height: 8),
          Expanded(
            child:isLoading
            ?Center(child: CircularProgressIndicator(),)
            :jobbordList.isEmpty
            ?Center(child: Text("No job found",
            style: TextStyle(color: Colors.grey),
            ))
             :ListView.separated(
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
                          Navigator.pushNamed(context, "/JobBoardDetailsPage",arguments: item["id"]);
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
