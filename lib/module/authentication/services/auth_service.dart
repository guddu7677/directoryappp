import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:directoryapp/module/authentication/model/savAddress_model.dart';

class ApiService {
  static const String apiBaseUrl = "https://meraprachaar.shop/api/";

  String fcmToken =
      "cqxIYFXHRzip5_BktfrTjW:APA91bG2NYN6og2_LHHql_hxxLWazNasa6B4cnG1TT8PbDhjP63FmK58qVADvIzzWxPWcWY9T-Gx2a6CZTT1nxDQJdNfX_y52SYPUmxh_6UqF1WKaQt70l0";

  Future<void> saveAuthToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print("Saving Token: $token");

      bool saved = await prefs.setString('token', token);

      if (saved) {
        print("Token SUCCESSFULLY saved");

        String? retrievedToken = prefs.getString('token');
        print(" Verified Token: ${retrievedToken?.substring(0, 20)}...");

        if (retrievedToken == token) {
          print(" Token verification SUCCESSFUL");
        } else {
          print("Token verification FAILED");
        }
      } else {
        print("Token save FAILED");
      }
    } catch (e) {
      print("Error saving token: $e");
    }
  }

  Future<String?> getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token != null && token.isNotEmpty) {
        print("Token Retrieved: ${token.substring(0, 20)}");
      } else {
        print("oken NOT FOUND in storage");
      }

      return token;
    } catch (e) {
      print("Error getting token: $e");
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null || token.isEmpty) {
      return false;
    }

    return true;
  }

  Future<Map<String, dynamic>> userSignup(String phone) async {
    try {
      final response = await http.post(
        Uri.parse("${apiBaseUrl}user-signup"),
        headers: {"Accept": "application/json"},
        body: {"mobile": phone},
      );

      if (response.statusCode == 200) {
        print("Signup Response: ${response.body}");
      } else {
        print("Signup Failed with status: ${response.statusCode}");
      }

      return json.decode(response.body);
    } catch (e) {
      print("Signup Error: $e");
      return {"status": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> userLogin(String phone) async {
    try {
      final response = await http.post(
        Uri.parse("${apiBaseUrl}user-login"),
        headers: {"Accept": "application/json"},
        body: {"mobile": phone},
      );

      if (response.statusCode == 200) {
        print("Login Response: ${response.body}");
      } else {
        print("Login Failed with status: ${response.statusCode}");
      }

      return json.decode(response.body);
    } catch (e) {
      print("Login Error: $e");
      return {"status": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String phone, String otp) async {
    try {
      print("Verifying OTP for: $phone");

      final response = await http.post(
        Uri.parse("${apiBaseUrl}user-verifyotp"),
        headers: {"Accept": "application/json"},
        body: {"mobile": phone, "otp": otp, "fcm_token": fcmToken},
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        print("OTP Verified Successfully");

        if (data["token"] != null && data["token"].toString().isNotEmpty) {
          print("Token found in response");
          await saveAuthToken(data["token"].toString());
        } else {
          print(" No token in response");
          print("Available keys: ${data.keys}");
        }
      } else {
        print("OTP Verification Failed: ${response.statusCode}");
      }

      return data;
    } catch (e) {
      print("Verify OTP Error: $e");
      return {"status": false, "message": "Error: $e"};
    }
  }

  Future<Map<String, dynamic>> fetchAllIndustries() async {
    try {
      final response = await http.post(
        Uri.parse("${apiBaseUrl}fetch-all-industry"),
        headers: {"Accept": "application/json"},
      );

      if (response.statusCode == 200) {
        print("Industries fetched successfully");
      }

      return json.decode(response.body);
    } catch (e) {
      print("Fetch Industries Error: $e");
      return {"status": false, "message": "Error: $e"};
    }
  }

  Future<Map<String, dynamic>> addUserBasicDetails({
    required String name,
    required String email,
    required String designation,
    String? company,
    String? alternateContact,
    required String industryId,
    String? aboutBusiness,
    String? businessGoal,
    List<String>? businessServices,
    String? profileImage,
    String? bannerImage,
  }) async {
    try {
      String? token = await getAuthToken();

      if (token == null || token.isEmpty) {
        print("Token is NULL or EMPTY");
        return {
          "status": false,
          "message": "Authentication token not found. Please login again.",
        };
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${apiBaseUrl}user-basic-details-add"),
      );

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['designation'] = designation;
      request.fields['industry'] = industryId;

      if (company != null && company.isNotEmpty) {
        request.fields['company'] = company;
      }

      if (alternateContact != null && alternateContact.isNotEmpty) {
        request.fields['alternate_contact'] = alternateContact;
      }

      if (aboutBusiness != null && aboutBusiness.isNotEmpty) {
        request.fields['about_business'] = aboutBusiness;
      }

      if (businessGoal != null && businessGoal.isNotEmpty) {
        request.fields['business_goal'] = businessGoal;
      }

      if (businessServices != null && businessServices.isNotEmpty) {
        for (int i = 0; i < businessServices.length; i++) {
          request.fields["business_service[$i]"] = businessServices[i];
        }
      }

      request.fields.forEach((key, value) {
        print("  $key : $value");
      });

      if (profileImage != null && profileImage.isNotEmpty) {
        var imageFile = await http.MultipartFile.fromPath(
          'image',
          profileImage,
        );
        request.files.add(imageFile);
      }

      if (bannerImage != null && bannerImage.isNotEmpty) {
        var bannerFile = await http.MultipartFile.fromPath(
          'business_banner',
          bannerImage,
        );
        request.files.add(bannerFile);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {
          "status": false,
          "message": "Failed to add details. Status: ${response.statusCode}",
          "response": response.body,
        };
      }
    } catch (e) {
      print("Add Basic Details Error: $e");
      return {"status": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> saveAddress(SavaddressModel data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        print("Token missing in saveAddress");
        return {"status": false, "message": "Token missing. Login again."};
      }

      print("Token found for saveAddress");

      final response = await http.post(
        Uri.parse("${apiBaseUrl}user-save-address"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(data.toJson()),
      );

      if (response.statusCode == 200) {
        print("Address saved successfully");
      } else {
        print("Save Address Failed with status: ${response.statusCode}");
      }

      return json.decode(response.body);
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  Future<void> logOut() async {
  try {
    final prefs = await SharedPreferences.getInstance();

    bool removed = await prefs.remove("token");

    if (removed) {
      print(" Token successfully removed (Logout success)");
    } else {
      print(" Token remove failed");
    }
  } catch (e) {
    print("Logout error: $e");
  }
}

}
