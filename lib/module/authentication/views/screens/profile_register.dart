import 'dart:io';
import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:directoryapp/core/widgets/universol_drop_down_field.dart';
import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRegister extends StatefulWidget {
  const ProfileRegister({super.key});

  @override
  State<ProfileRegister> createState() => _ProfileRegisterState();
}

  class _ProfileRegisterState extends State<ProfileRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController altContactController = TextEditingController();
  final TextEditingController descBussiness = TextEditingController();
  final TextEditingController bussinessGoal = TextEditingController();
  final TextEditingController bussinessService = TextEditingController();
  String? selectedIndustryId;

  final ApiService _apiService = ApiService();
  bool isLoading = false;
  String? profileImagePath;
  String? bannerImagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(bool isProfile) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        if (isProfile) {
          profileImagePath = image.path;
        } else {
          bannerImagePath = image.path;
        }
      });
    }
  }

  Future<void> submitForm() async {
    if (nameController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your name");
      return;
    }

    if (emailController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your email");
      return;
    }

    if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(emailController.text.trim())) {
      Fluttertoast.showToast(msg: "Please enter a valid email");
      return;
    }

    if (designationController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your designation");
      return;
    }
    if (companyController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Please enter company details");
    }

    if (selectedIndustryId == null) {
      Fluttertoast.showToast(msg: "Please select an industry");
      return;
    }

    setState(() => isLoading = true);

    List<String> services = bussinessService.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    final result = await _apiService.addUserBasicDetails(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      designation: designationController.text.trim(),
      company: companyController.text.trim(),
      alternateContact: altContactController.text.trim(),
      industryId: selectedIndustryId!,
      aboutBusiness: descBussiness.text.trim(),
      businessGoal: bussinessGoal.text.trim(),
      businessServices: services,
      profileImage: profileImagePath,
      bannerImage: bannerImagePath,
    );
    print(result);
    setState(() => isLoading = false);

    if (result["status"] == true) {
      Fluttertoast.showToast(msg: "Profile created successfully");
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/AddressScreen",
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(
        msg: result["message"] ?? "Failed to create profile",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new, color: AppColors.PrimaryColor),
        ),
        centerTitle: true,
        title: Text("Register", style: AppTextStyle.semiBold17black),
      ),
      bottomNavigationBar: _bottomButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _backgroundImage(),
              Column(
                children: [
                  SizedBox(height: 50),
                  _profileSection(),
                  SizedBox(height: 40),
                  _formSection(),
                  SizedBox(height: 80),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Opacity(
      opacity: 0.85,
      child: bannerImagePath == null
          ? Image.asset(
              AppImage.profileBG,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Image.file(
              File(bannerImagePath!),
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _profileSection() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => pickImage(false),
          child: Icon(
            Icons.camera_alt_outlined,
            size: 40,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Add banner",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(height: 35),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 126,
              width: 126,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderColor),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: profileImagePath == null
                      ? AssetImage(AppImage.Profile)
                      : FileImage(File(profileImagePath!)) as ImageProvider,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => pickImage(true),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.PrimaryColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text("Profile picture / Logo", style: AppTextStyle.semiBold17black),
      ],
    );
  }

  Widget _formSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          UniversalTextField(
            controller: nameController,
            hintText: 'Name',
            labelText: 'Enter Name',
          ),
          const SizedBox(height: 16),
          UniversalTextField(
            controller: emailController,
            hintText: 'Email Address',
            labelText: 'Email Address',
          ),
          const SizedBox(height: 16),
          UniversalTextField(
            controller: designationController,
            hintText: 'Input',
            labelText: 'Designation',
          ),
          const SizedBox(height: 16),
          UniversalTextField(
            controller: companyController,
            hintText: 'Input',
            labelText: 'Company',
          ),
          const SizedBox(height: 16),
        
          UniversalTextField(
            controller: altContactController,
            hintText: 'Input',
            labelText: 'Alternate Contact Number',
          ),
          SizedBox(height: 16),
          UniversalDropdownField(
            labelText: "Industry",
            hintText: "Select Industry",
            onChangedIndustryId: (id) {
              selectedIndustryId = id;
            },
          ),

          SizedBox(height: 16),
          UniversalTextField(
            MaxLines: 4,
            controller: descBussiness,
            hintText: 'Input',
            labelText: 'Description about your Business',
          ),
          const SizedBox(height: 16),
          UniversalTextField(
            controller: bussinessGoal,
            hintText: 'Input',
            labelText: 'Your business goals',
          ),
          const SizedBox(height: 16),
          UniversalTextField(
            controller: bussinessService,
            hintText: 'Input',
            labelText: 'Your business Services (comma separated)',
          ),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
      child: UniversalButton(
        title: isLoading ? "Saving..." : "Save Changes",
        textColor: Colors.white,
        bgColor: AppColors.PrimaryColor,
        borderRadius: 12,
        onTap: isLoading ? () {} : submitForm,
      ),
    );
  }
}