import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/core/widgets/universol_drop_down_field.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController descBusiness = TextEditingController();
  final TextEditingController businessGoal = TextEditingController();
  final TextEditingController businessService = TextEditingController();
 String? selectedIndustryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
appBar: BuildHeader(title: "Profile Information"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 126,
                        width: 126,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.borderColor),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImage.Profile),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 10,
                        
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.PrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Text(
                    "Profile picture / Logo",
                    style: AppTextStyle.semiBold17black,
                  ),

                  SizedBox(height: 20),

                  UniversalTextField(
                    controller: nameController,
                    hintText: 'Name',
                    labelText: 'Enter Name',
                  ),
                  SizedBox(height: 16),

                  UniversalTextField(
                    controller: emailController,
                    hintText: 'Email Address',
                    labelText: 'Email Address',
                  ),
                  SizedBox(height: 16),

                  UniversalTextField(
                    controller: designationController,
                    hintText: 'Designation',
                    labelText: 'Designation',
                  ),
                  SizedBox(height: 16),

                  UniversalTextField(
                    controller: companyController,
                    hintText: 'Company Name',
                    labelText: 'Company Name',
                  ),
                  SizedBox(height: 16),

                  UniversalTextField(
                    controller: contactController,
                    hintText: 'Contact Details',
                    labelText: 'Contact Details',
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
                    controller: descBusiness,
                    hintText: 'Describe your Business',
                    labelText: 'Description about your Business',
                  ),
                  SizedBox(height: 16),

                  UniversalTextField(
                    controller: businessGoal,
                    hintText: 'Business Goals',
                    labelText: 'Your Business Goals',
                  ),
                  SizedBox(height: 16),

                  UniversalTextField(
                    controller: businessService,
                    hintText: 'Business Services',
                    labelText: 'Your Business Services',
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.fromLTRB(20, 0, 20, 25),
        child: UniversalButton(
          title: "Save Changes",
          textColor: Colors.white,
          bgColor: AppColors.PrimaryColor,
          borderRadius: 12,
          onTap: () {
            Navigator.pushNamed(context, "/SettingScreen");
          },
        ),
      ),
    );
  }
}
