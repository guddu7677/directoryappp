import 'dart:convert';
import 'package:directoryapp/module/authentication/model/update_user_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "https://meraprachaar.shop/api/";

  Future<Map<String, dynamic>> userSignup(String phone) async {
    try {
      final response = await http.post(
        Uri.parse("${baseUrl}user-signup"),
        headers: {"Accept": "application/json"},
        body: {"mobile": phone},
      );
      print("URL: ${baseUrl}user-signup");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          "status": false,
          "message": "Failed to send OTP. Status: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"status": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> userlogin(String phone) async {
    try {
      final response = await http.post(
        Uri.parse("${baseUrl}user-login"),
        headers: {"Accept": "application/json"},
        body: {"mobile": phone},
      );
      print("URL: ${baseUrl}user-login");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          "status": false,
          "message": "Failed to send OTP. Status: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"status": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String phone, String otp) async {
    try {
      String fcmToken = await getFcmToken();

      final response = await http.post(
        Uri.parse("${baseUrl}user-verifyotp"),
        headers: {"Accept": "application/json"},
        body: {"mobile": phone, "otp": otp, "fcm_token": fcmToken},
      );
      print("URL: ${baseUrl}user-verifyotp");
      print(response.body);

      if (response.statusCode == 200) {
        final result = json.decode(response.body);

        if (result["status"] == true) {
          await saveUserData(result);
        }
        print("Full OTP Response: ${result}");
        print("Data: ${result['data']}");
        print("Token directly: ${result['token']}");
        print("Data.token: ${result['data']?['token']}");
        print("Data.user: ${result['data']?['user']}");
        print("Data.user.token: ${result['data']?['user']?['token']}");

        return result;
      } else {
        return {
          "status": false,
          "message": "Verification failed. Status: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"status": false, "message": "Network error: $e"};
    }
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
  final prefs = await SharedPreferences.getInstance();

  print("Saving UserData: $userData");

  var data = userData["data"] ?? {};

  await prefs.setString("user_data", json.encode(data));

  String? token =
      data["token"] ??
      data["user"]?["token"] ??
      userData["token"] ??
      userData["user"]?["token"];

  print("Extracted Token: $token");

  if (token != null) {
    await prefs.setString("auth_token", token);
  } else {
    print("Token NOT FOUND in response!");
  }

  int? userId = data["id"] ?? 
                data["user"]?["id"] ?? 
                userData["id"] ?? 
                userData["user"]?["id"];

  print("Extracted User ID: $userId"); 

  if (userId != null) {
    await prefs.setInt("user_id", userId);
    print("User ID saved: $userId"); 
  } else {
    print("User ID not found in response structure!");
    print("Available keys in data: ${data.keys.toList()}");
    print("Available keys in userData: ${userData.keys.toList()}");
  }

  await prefs.setBool("is_logged_in", true);
}
  Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("mobile", phone);
  }

  Future<String> getSavedPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile") ?? "";
  }

  Future<String> getFcmToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("fcm_token") ?? "default_fcm_token";
  }

  Future<void> saveFcmToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("fcm_token", token);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_logged_in") ?? false;
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");

    print("getAuthToken: $token");
    return token;
  }

 Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt("user_id");
    print("getUserId: $userId");
    return userId;
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

      if (token == null) {
        return {
          "status": false,
          "message": "Authentication token not found. Please login again.",
        };
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}user-basic-details-add"),
      );
      print(request);
      print("addressprofile:${baseUrl}user-basic-details-add");
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
        for (var service in businessServices) {
          request.fields['business_service[]'] = service;
        }
      }
      request.fields.forEach((key, value) {
        print("$key : $value");
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {
          "success": false,
          "message": "Failed to add details. Status: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Network error: $e"};
    }
  }
  
  Future<Map<String, dynamic>> fetchAllIndustries() async {
    try {
      final response = await http.post(
        Uri.parse("${baseUrl}fetch-all-industry"),
        headers: {"Accept": "application/json"},
      );
      print(response);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          "success": false,
          "message":
              "Failed to fetch industries. Status: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Network error: $e"};
    }
  }

Future<Map<String, dynamic>> saveAddress({
  required String houseNo,
  required String locality,
  required String city,
  required String state,
  required String pincode,
}) async {
  try {
    String? token = await getAuthToken();
    int? userId = await getUserId();

    if (token == null) {
      return {
        "success": false,
        "message": "Authentication token not found. Please login again",
      };
    }
    if (userId == null) {
      return {"success": false, "message": "User Id not found"};
    }

    final Map<String, String> body = {
      "user_id": userId.toString(),
      "house_no": houseNo,
      "locality": locality,
      "city": city,
      "state": state,
      "pincode": pincode,
    };

    print(" Save Address Body: $body");

    final response = await http.post(
      Uri.parse("${baseUrl}user-save-address"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );

    print("Save Address Response: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return {
        "success": false,
        "message": "Failed to save address. status:${response.statusCode}",
      };
    }
  } catch (e) {
    return {"success": false, "message": "Network error: $e"};
  }
}


  Future<Map<String, dynamic>> fetchUserProfile() async {
    try {
      String? token = await getAuthToken();
      if (token == null) {
        return {"success": false, "message": "authentication token not found "};
      }
      final responce = await http.get(
        Uri.parse("${baseUrl}fetch-user-profile"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (responce.statusCode == 200) {
        return json.decode(responce.body);
      } else {
        return {
          "success": false,
          "message": "Failed to fetch profile. Status: ${responce.statusCode}",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> fetchNotifications() async {
    String? token = await getAuthToken();
    if (token == null) {
      return {"success": false, "message": "Authentication token not found"};
    }
    final responce = await http.get(
      Uri.parse("${baseUrl}toggleNotification"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      return {
        "success": false,
        "message": "Failed to  toggle notification.status:${responce.body}",
      };
    }
  }

  Future<void> updateUserProfile(
    UpdateUserProfileRequest data,
    String token,
  ) async {
    var uri = Uri.parse("${baseUrl}update-user-profile");
    var request = http.MultipartRequest("Post", uri);
    request.headers["Authorization"] = "Bearer $token";
    request.fields.addAll(data.toFields());
    for (var item in data.toListFields()) {
      request.fields[item.key] = item.value;
    }
    data.toFiles().forEach((key, file) async {
      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath(key, file.path));
      }
    });
    final responce = await request.send();
    final respsr = await responce.stream.bytesToString();
    print("Responce:$respsr");
  }

  Future<Map<String, dynamic>> fetchSingleBusinessDetails({
    required String busnessId,
  }) async {
    String? token = await getAuthToken();
    if (token == null) {
      return {"success": false, "message": "Authentication token not found"};
    }
    final responce = await http.post(
      Uri.parse("${baseUrl}fetch-single-business-details"),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {"id": busnessId},
    );
    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      return {
        "success": false,
        "message":
            "Failed to fetch business details. status:${responce.statusCode}",
      };
    }
  }

  Future<Map<String, dynamic>> updateUserMainProfile({
    String? name,
    String? email,
    String? designation,
    String? company,
    String? alternateContact,
    String? industry,
    String? aboutBusiness,
    String? businessGoal,
    List<String>? businessServices,
    String? profileImage,
    String? bannerImage,
    String? houseNo,
    String? locality,
    String? city,
    String? state,
    String? pincode,
  }) async {
    try {
      String? token = await getAuthToken();

      if (token == null) {
        return {
          "success": false,
          "message": "Authentication token not found. Please login again.",
        };
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${baseUrl}update-user-profile"),
      );

      request.headers['Authorization'] = 'Bearer $token';

      if (name != null && name.isNotEmpty) {
        request.fields['name'] = name;
      }

      if (email != null && email.isNotEmpty) {
        request.fields['email'] = email;
      }

      if (designation != null && designation.isNotEmpty) {
        request.fields['designation'] = designation;
      }

      if (company != null && company.isNotEmpty) {
        request.fields['company'] = company;
      }

      if (alternateContact != null && alternateContact.isNotEmpty) {
        request.fields['alternate_contact'] = alternateContact;
      }

      if (industry != null && industry.isNotEmpty) {
        request.fields['industry'] = industry;
      }

      if (aboutBusiness != null && aboutBusiness.isNotEmpty) {
        request.fields['about_business'] = aboutBusiness;
      }

      if (businessGoal != null && businessGoal.isNotEmpty) {
        request.fields['business_goal'] = businessGoal;
      }

      if (businessServices != null && businessServices.isNotEmpty) {
        for (var service in businessServices) {
          request.fields['business_service[]'] = service;
        }
      }

      if (houseNo != null && houseNo.isNotEmpty) {
        request.fields['house_no'] = houseNo;
      }

      if (locality != null && locality.isNotEmpty) {
        request.fields['locality'] = locality;
      }

      if (city != null && city.isNotEmpty) {
        request.fields['city'] = city;
      }

      if (state != null && state.isNotEmpty) {
        request.fields['state'] = state;
      }

      if (pincode != null && pincode.isNotEmpty) {
        request.fields['pincode'] = pincode;
      }

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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {
          "success": false,
          "message":
              "Failed to update main profile. Status: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Network error: $e"};
    }
  }

  Future<Map<String, dynamic>> addReview({
    required String token,
    required String reviewUserId,
    required String rating,
    required String review,
  }) async {
    var uri = Uri.parse("${baseUrl}add-user-review");
    var request = http.MultipartRequest("POST", uri);
    request.headers["Accept"] = "application/json";
    request.headers["Authorization"] = "Bearer $token";
    request.fields["review_user_id"] = reviewUserId;
    request.fields["rating"] = rating;
    request.fields["review"] = review;
    final streamedResponse = await request.send();
    final responce = await http.Response.fromStream(streamedResponse);
    return json.decode(responce.body);
  }

  Future<Map<String, dynamic>> changeActiveStatus() async {
    final responce = await http.get(Uri.parse("${baseUrl}user/active"));
    if (responce.statusCode == 200) {
      return jsonDecode(responce.body);
    } else {
      return {"status": false, "message": "Somthing went wrong"};
    }
  }

  Future<Map<String, dynamic>> userReview() async {
    final responce = await http.get(Uri.parse("${baseUrl}fetch-user-reviews"));
    if (responce.statusCode == 200) {
      return jsonDecode(responce.body);
    } else {
      return {"status": false, "message": "Somthing went wrong "};
    }
  }
}
