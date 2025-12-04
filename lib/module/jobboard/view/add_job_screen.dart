import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/constants/constant_images.dart';
import 'package:directoryapp/core/widgets/universol_button.dart';
import 'package:directoryapp/core/widgets/universol_textfield.dart';
import 'package:flutter/material.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key});

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController requirementController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController minimumSalaryController = TextEditingController();
  final TextEditingController maximumSalaryController = TextEditingController();

  @override
  void dispose() {
    jobTitleController.dispose();
    descriptionController.dispose();
    requirementController.dispose();
    locationController.dispose();
    minimumSalaryController.dispose();
    maximumSalaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new, color: AppColors.PrimaryColor),
        ),
        centerTitle: true,
        title: Text("Add Job", style: AppTextStyle.semiBold17black),
      ),

      bottomNavigationBar: _bottomButton(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _backgroundImage(),
               SizedBox(height: 20),
              _formSection(),
               SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Stack(
      children:[ Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.profileBG),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
      ),
      Positioned(
        top: 50,
        right: 0,
        left: 0,
        bottom: 0,
        child: Column(
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: 50,
            color: Colors.white.withOpacity(0.85),
          ),
         SizedBox(height: 6),
          Text("Add Banner", style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
            ),
      ),
      ]
    );
  }

  Widget _formSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UniversalTextField(
            controller: jobTitleController,
            hintText: 'Enter Job Title',
            labelText: 'Job Title',
          ),
           SizedBox(height: 16),
          UniversalTextField(
            controller: descriptionController,
            MaxLines: 4,
            hintText: 'Enter Description',
            labelText: 'Description',
          ),
         SizedBox(height: 16),
          UniversalTextField(
            controller: requirementController,
            hintText: 'Enter Requirements',
            labelText: 'Requirements',
          ),
          const SizedBox(height: 16),
          UniversalTextField(
            controller: locationController,
            hintText: 'Enter Location',
            labelText: 'Location',
          ),
         SizedBox(height: 22),
          Text("Salary Range", style: AppTextStyle.semiBold17black),
           SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: UniversalTextField(
                  controller: minimumSalaryController,
                  hintText: 'Min Salary',
                  labelText: 'Minimum Salary',
                ),
              ),
               SizedBox(width: 12),
              Expanded(
                child: UniversalTextField(
                  controller: maximumSalaryController,
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                  hintText: 'Max Salary',
                  labelText: 'Maximum Salary',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    return Padding(
      padding:EdgeInsets.fromLTRB(20, 0, 20, 25),
      child: UniversalButton(
        title: "Submit",
        textColor: Colors.white,
        bgColor: AppColors.PrimaryColor,
        borderRadius: 12,
        onTap: () {
          Navigator.pushNamed(context, "/MainScreen");
        },
      ),
    );
  }
}
