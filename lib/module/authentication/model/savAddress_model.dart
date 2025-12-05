class SavaddressModel {
  int? userId;
  String house_no;
  String locality;
  String city;
  String state;
  String pincode;

  SavaddressModel({
    this.userId,
    required this.house_no,
    required this.locality,
    required this.city,
    required this.state,
    required this.pincode,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "house_no": house_no,
      "locality": locality,
      "city": city,
      "state": state,
      "pincode": pincode,
    };
  }
}
