import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';

class UniversalDropdownField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final TextEditingController controller;

  const UniversalDropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.controller,
  });

  @override
  State<UniversalDropdownField> createState() => _UniversalDropdownFieldState();
}

class _UniversalDropdownFieldState extends State<UniversalDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller.text.isNotEmpty
        ? widget.controller.text
        : null;
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

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,              // ✔ Correct
              hint: Text(widget.hintText),
              isExpanded: true,

              icon: const Icon(Icons.arrow_drop_down_outlined),
              style: AppTextStyle.semiBold14black,

              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  widget.controller.text = value!;
                });
              },

              items: widget.items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
