import 'dart:convert';
import 'package:directoryapp/module/home/model/state_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  static const String apiUrl = "https://meraprachaar.shop/api/";

  Future<List<StateModel>> getStates() async {
    final response = await http.get(
      Uri.parse("${apiUrl}fetch-all-states"),
      headers: {"Accept": "application/json",},
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200 && data['status'] == true) {
      return (data['data'] as List).map((e) => StateModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load states");
    }
  }

  Future<Map<String, dynamic>> homePageBussiness() async {
    final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

    try {
      final response = await http.get(
        Uri.parse("${apiUrl}fetch-businesses"),
        headers: {"Accept": "application/json",
                 "Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
      } else {
        print("Save Address Failed with status: ${response.statusCode}");
      }
      return json.decode(response.body);
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }
}
