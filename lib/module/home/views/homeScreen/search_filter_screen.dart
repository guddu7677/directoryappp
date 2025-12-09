import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:directoryapp/core/widgets/universol_drop_down_field.dart';
import 'package:directoryapp/module/home/widgets/universal_state_field.dart';
import 'package:flutter/material.dart';

class SearchfilterScreen extends StatefulWidget {
  const SearchfilterScreen({super.key});

  @override
  State<SearchfilterScreen> createState() => _SearchfilterScreenState();
}

class _SearchfilterScreenState extends State<SearchfilterScreen> {
  final TextEditingController locationByStateController =
      TextEditingController();
  String? selectedIndustryId;
  String? sdelectedStateId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildHeader(title: "Search Filter"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _formSection(),
                  SizedBox(height: 24),
                  _homeContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formSection() {
    return Column(
      children: [
        UniversalDropdownField(
          labelText: "Industry",
          hintText: "Select Industry",
          onChangedIndustryId: (id) {
            selectedIndustryId = id;
          },
        ),
        const SizedBox(height: 16),
        UniversalStateDropdownField(
          labelText: "State",
          hintText: "Select State",
          onChangedStateId: (stateId) {
            print("Selected State ID: $stateId");
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _homeContent() {
    final List<String> items = [
      "Lorim Ipsum",
      "djhd Ipsum",
      "djdj Ipsum",
      "Lorim Isuguspsum",
      "Lorim dhsd",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => _searchItem(icon: Icons.search, text: item))
          .toList(),
    );
  }

  Widget _searchItem({required IconData icon, required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 12),
              Text(text, style: AppTextStyle.semiBold14black),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
