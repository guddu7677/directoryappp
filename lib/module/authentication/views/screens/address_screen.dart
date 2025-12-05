
import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/module/authentication/model/savAddress_model.dart';
import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController houseNumController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  bool isLoading = false;
  final ApiService apiService = ApiService();

 Future<void> onSaveAddress() async {
  if (houseNumController.text.trim().isEmpty) {
    Fluttertoast.showToast(msg: "Please enter house number");
    return;
  }
  if (localityController.text.trim().isEmpty) {
    Fluttertoast.showToast(msg: "Please enter locality");
    return;
  }
  if (cityController.text.trim().isEmpty) {
    Fluttertoast.showToast(msg: "Please enter city");
    return;
  }
  if (stateController.text.trim().isEmpty) {
    Fluttertoast.showToast(msg: "Please enter state");
    return;
  }
  if (pinCodeController.text.trim().isEmpty) {
    Fluttertoast.showToast(msg: "Please enter pincode");
    return;
  }

  setState(() => isLoading = true);

  SavaddressModel model = SavaddressModel(
    house_no: houseNumController.text.trim(),
    locality: localityController.text.trim(),
    city: cityController.text.trim(),
    state: stateController.text.trim(),
    pincode: pinCodeController.text.trim(),
  );

  final result = await apiService.saveAddress(model);

  setState(() => isLoading = false);

  if ((result["status"] == true || result["success"] == true)) {
    Fluttertoast.showToast(msg: "Address saved successfully");

    Navigator.pushNamedAndRemoveUntil(
      context,
      "/MainScreen",
      (route) => false,
    );
  } else {
    Fluttertoast.showToast(
      msg: result["message"] ?? "Something went wrong",
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            BuildHeader(title: "Address"),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    UniversalTextField(
                      controller: houseNumController,
                      hintText: 'Input',
                      labelText: 'House Number',
                    ),
                    const SizedBox(height: 16),

                    UniversalTextField(
                      controller: localityController,
                      hintText: 'Input',
                      labelText: 'Locality',
                    ),
                    const SizedBox(height: 16),

                    UniversalTextField(
                      controller: cityController,
                      hintText: 'Input',
                      labelText: 'City',
                    ),
                    const SizedBox(height: 16),

                    UniversalTextField(
                      controller: stateController,
                      hintText: 'Input',
                      labelText: 'State',
                    ),
                    SizedBox(height: 16),

                    UniversalTextField(
                      controller: pinCodeController,
                      hintText: 'Input',
                      labelText: 'Pincode',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UniversalButton(
          title: isLoading ? "Saving..." : "Save Address",
          textColor: Colors.white,
          bgColor: AppColors.PrimaryColor,
          onTap: isLoading ?(){}:onSaveAddress
        ),
      ),
    );
  }
}
