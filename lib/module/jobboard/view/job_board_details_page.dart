import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/module/jobboard/service/api_job_service.dart';
import 'package:flutter/material.dart';

class JobBoardDetailsPage extends StatefulWidget {
  final int jobId;

  const JobBoardDetailsPage({super.key, required this.jobId});

  @override
  State<JobBoardDetailsPage> createState() => _JobBoardDetailsPageState();
}

class _JobBoardDetailsPageState extends State<JobBoardDetailsPage> {
  Map<String, dynamic>? jobDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJobDetails();
  }

  Future<void> loadJobDetails() async {
    final api = ApiJobService();
    final response = await api.fetchSingleJob(widget.jobId);

    if (mounted) {
      setState(() {
        isLoading = false;
        jobDetails = response["data"] ?? {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(
        title: "Job Details",
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobDetails == null
              ? const Center(child: Text("Failed to load job details"))
              : _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImage.profileBG,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImage.logoImg, height: 80, width: 80),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(jobDetails!["job_title"] ?? "Job Title",
                        style: AppTextStyle.semiBold22black),
                    const SizedBox(height: 4),
                    Text(jobDetails!["location"] ?? "Location",
                        style: AppTextStyle.normal17black),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          _section("Description", jobDetails!["description"] ?? ""),
          _section("Salary",
              "${jobDetails!["min_salary"]} - ${jobDetails!["max_salary"]}"),
          _section("Requirements", jobDetails!["requirement"] ?? ""),
          _section("Address", jobDetails!["location"] ?? ""),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _section(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.semiBold17black),
          const SizedBox(height: 8),
          Text(content, style: AppTextStyle.normal15black),
        ],
      ),
    );
  }
}
