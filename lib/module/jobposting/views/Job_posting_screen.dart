import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/module/jobboard/service/api_job_service.dart';
import 'package:directoryapp/module/jobboard/view/job_board_details_page.dart';
import 'package:directoryapp/module/jobposting/widgets/build_jobcard_widgets.dart';
import 'package:directoryapp/module/setting/SettingTabScreen/widgets/job_lable_widget.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  State<JobPostingScreen> createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  List<Map<String, dynamic>> jobList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    setState(() => isLoading = true);

    final api = ApiJobService();
    final response = await api.fetchAllJobs();

    setState(() => isLoading = false);

    if (response["status"] == true && response["data"] != null) {
      final data = response["data"] as List;
      setState(() {
        jobList = data.map((job) {
          return {
            "id": job["id"],
            "companyShortName": _getShortName(job["job_title"] ?? ""),
            "companyName": job["job_title"] ?? "",
            "salaryRange":
                "${job["min_salary"] ?? "0"} - ${job["max_salary"] ?? "50000"}",
            "location": job["location"] ?? "",
            "description": job["description"] ?? "",
            "label": "Added",
            "icon": Icons.bookmark_border_outlined,
          };
        }).toList();
      });
    }
  }

  String _getShortName(String name) {
    if (name.isEmpty) return "NA";

    final parts = name.split(" ");

    if (parts.length >= 2) {
      return parts[0][0] + parts[1][0];
    }

    return name.substring(0, name.length.clamp(1, 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(
        title: "Job Postings",
        onBack: () => Navigator.pop(context),
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: AppColors.PrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.bookmark_add_outlined,
            color: AppColors.PrimaryColor,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobList.isEmpty
          ? _emptyState()
          : _jobListView(),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.work_off, size: 60, color: Colors.grey),
          SizedBox(height: 16),
          Text("No jobs posted yet", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _jobListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: jobList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) {
        final item = jobList[i];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => JobBoardDetailsPage(jobId: item["id"]),
              ),
            );
          },
          child: JobCard(
            companyShortName: item["companyShortName"],
            companyName: item["companyName"],
            salaryRange: item["salaryRange"],
            location: item["location"],
            description: item["description"],
            bottomlablewidget: BottomlableContainer(
              label: item["label"],
              icon: item["icon"],
            ),
          ),
        );
      },
    );
  }
}
