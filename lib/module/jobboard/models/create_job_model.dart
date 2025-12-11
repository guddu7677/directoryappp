import 'dart:io';

class CreateJobModel {
  final String job_title;
  final String description;
  final String requirement;
  final String location;
  final String min_salary;
  final String max_salary;
  final File? bannerImage;

  CreateJobModel({
    required this.job_title,
    required this.description,
    required this.requirement,
    required this.location,
    required this.min_salary,
    required this.max_salary,
    this.bannerImage,
  });

  Map<String, String> toJson() {
    return {
      "job_title": job_title,
      "description": description,
      "requirement": requirement,
      "location": location,
      "min_salary": min_salary,
      "max_salary": max_salary,
    };
  }

  Map<String, File?> toFiles() {
    return {
      "banner": bannerImage,
    };
  }
}