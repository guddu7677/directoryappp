import 'dart:io';

class UpdateUserProfileRequest {
  File? image;
  File? businessBanner;
  String name;
  String designation;
  String company;
  String alternateContact;
  String industry;
  String aboutBusiness;
  String businessGoal;
  List<String> businessService;
  String email;

  UpdateUserProfileRequest({
    this.image,
    this.businessBanner,
    required this.name,
    required this.designation,
    required this.company,
    required this.alternateContact,
    required this.industry,
    required this.aboutBusiness,
    required this.businessGoal,
    required this.businessService,
    required this.email,
  });
  Map<String, String> toFields() {
    return {
      "name": name,
      "designation": designation,
      "company": company,
      "alternateContact": alternateContact,
      "industry": industry,
      "aboutBusiness": aboutBusiness,
      "businessGoal": businessGoal,
      "email": email,
    };
  }

  List<MapEntry<String, String>> toListFields() {
    return businessService
        .map((e) => MapEntry("business_service[]", e))
        .toList();
  }

  Map<String, File?> toFiles() {
    return {"image": image, "business_banner": businessBanner};
  }
}
