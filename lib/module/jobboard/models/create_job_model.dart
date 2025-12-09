import 'dart:io';
import 'package:flutter/material.dart';

class CreateJobModel {
  final int job_id;
  final String job_title;
  final String description;
  final String requirement;
  final String location;
  final String min_salary;
  final String max_salary;
  final File? bannerImage;

  CreateJobModel({
    required this.job_id,
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
      "job_id": job_id.toString(),
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
