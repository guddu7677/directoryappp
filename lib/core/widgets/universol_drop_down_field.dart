import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/module/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class UniversalDropdownField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function(String) onChangedIndustryId;

  const UniversalDropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChangedIndustryId,
  });

  @override
  State<UniversalDropdownField> createState() => _UniversalDropdownFieldState();
}

class _UniversalDropdownFieldState extends State<UniversalDropdownField> {
  final ApiService _apiService = ApiService();
  List<Map<String, dynamic>> industryList = [];
  String? selectedIndustryId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchIndustries();
  }

  Future<void> fetchIndustries() async {
    setState(() {
      isLoading = true;
    });

    final response = await _apiService.fetchAllIndustries();
    print("Industry Response: $response");

    if (response["status"] == true && response["data"] != null) {
      setState(() {
        industryList = List<Map<String, dynamic>>.from(response["data"]);
        isLoading = false;
      });
      print("Industries loaded: ${industryList.length}");
    } else {
      setState(() {
        isLoading = false;
      });
      print("Failed to load industries");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppTextStyle.semiBold14black),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderColor),
            color: Colors.white,
          ),
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.PrimaryColor,
                      ),
                    ),
                  ),
                )
              : DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(widget.hintText),
                    value: selectedIndustryId,
                    isExpanded: true,
                    items: industryList.isEmpty
                        ? [
                            DropdownMenuItem(
                              value: null,
                              enabled: false,
                              child: Text("No industries available"),
                            )
                          ]
                        : industryList.map((item) {
                            return DropdownMenuItem(
                              value: item['id'].toString(),
                              child: Text(item['name'] ?? 'Unknown'),
                            );
                          }).toList(),
                    onChanged: industryList.isEmpty
                        ? null
                        : (value) {
                            setState(() {
                              selectedIndustryId = value;
                            });
                            if (value != null) {
                              widget.onChangedIndustryId(value);
                            }
                          },
                  ),
                ),
        )
      ],
    );
  }
}