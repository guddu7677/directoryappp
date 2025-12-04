import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiJobService {
  static const String apiBaseUrl = "https://meraprachaar.shop/api/";

  Future<Map<String, dynamic>> fetchAllUser({
    required String token,
    required String userId,
  }) async {
    final url = Uri.parse("${apiBaseUrl}fetch-all-jobs");
    var request = http.MultipartRequest("POST", url);
    request.headers["Accept"] = "application/json";
    request.headers["Authorization"] = "Bearer $token";

    request.fields["user_Id"] = userId;
    final stremedRes = await request.send();
    final responce = await http.Response.fromStream(stremedRes);
    return jsonDecode(responce.body);
  }
}
