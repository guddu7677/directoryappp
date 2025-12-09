import 'dart:convert';

import 'package:directoryapp/module/jobboard/models/create_job_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiJobService {
  static const String apiBaseUrl = "https://meraprachaar.shop/api/";

  Future<Map<String, dynamic>> createJob(CreateJobModel model) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final url = Uri.parse("${apiBaseUrl}create-job");

    var request = http.MultipartRequest("POST", url);
    request.headers["Accept"] = "application/json";
    request.headers["Authorization"] = "Bearer $token";

    request.fields.addAll(model.toJson());

    if (model.bannerImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          "banner",
          model.bannerImage!.path,
        ),
      );
    }

    final streamedRes = await request.send();
    final response = await http.Response.fromStream(streamedRes);

    return jsonDecode(response.body);
  }
}
