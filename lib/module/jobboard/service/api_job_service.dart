import 'dart:convert';
import 'package:directoryapp/module/jobboard/models/create_job_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiJobService {
  static const String apiUrl = "https://meraprachaar.shop/api/";

  Future<Map<String, dynamic>> createJob(CreateJobModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        return {
          "status": false,
          "message": "Token missing. Please login again",
        };
      }

      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${apiUrl}create-job"),
      );

      request.fields.addAll(model.toJson());

      if (model.bannerImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath("banner", model.bannerImage!.path),
        );
      }

      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });

      print("Sending Job Data: ${request.fields}");

      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);

      print("Status: ${response.statusCode}");
      print("Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }

      return {
        "status": false,
        "message": "Failed to create job. Status: ${response.statusCode}",
      };
    } catch (e) {
      print("Error(createJob): $e");
      return {"status": false, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> fetchAllJobs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        return {"status": false, "message": "Token not found"};
      }

      final response = await http.post(
        Uri.parse("${apiUrl}fetch-user-jobs"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Fetch jobs status: ${response.statusCode}");
      print("Fetch jobs body: ${response.body}");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }

      return {"status": false, "message": "Failed to fetch jobs"};
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  Future<Map<String, dynamic>> fetchSingleJob(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      final response = await http.post(
        Uri.parse("${apiUrl}fetch-single-job"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {"id": id.toString()},
      );
      print("Single job: ${response.body}");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return {"status": false, "message": "Failed to fetch single jobs"};
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }
Future<Map<String, dynamic>> fetchjobBoard({
  String? jobTitle,
  String? company,
  String? industry,
  String? location,
  String? minSalary,
  String? maxSalary,
  String? search,
}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token == null) {
      return {"status": false, "message": "Token not found"};
    }

    final body = {
      "job_title": jobTitle ?? "",
      "company": company ?? "",
      "industry": industry ?? "",
      "location": location ?? "",
      "min_salary": minSalary ?? "",
      "max_salary": maxSalary ?? "",
      "search": search ?? "",
    };

    final response = await http.post(
      Uri.parse("${apiUrl}job-board"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );

    print("Job board: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return {"status": false, "message": "Failed jobBoard"};
  } catch (e) {
    return {"status": false, "message": e.toString()};
  }
}

}
