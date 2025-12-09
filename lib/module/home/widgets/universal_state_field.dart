import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/module/home/model/state_model.dart';
import 'package:directoryapp/module/home/services/home_service.dart';
import 'package:flutter/material.dart';

class UniversalStateDropdownField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function(String stateId) onChangedStateId;

  const UniversalStateDropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChangedStateId,
  });

  @override
  State<UniversalStateDropdownField> createState() =>
      _UniversalStateDropdownFieldState();
}

class _UniversalStateDropdownFieldState
    extends State<UniversalStateDropdownField> {
  String? selectedStateId;
  late Future<List<StateModel>> stateFuture;

  @override
  void initState() {
    super.initState();
    stateFuture = HomeService().getStates();
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
          child: FutureBuilder<List<StateModel>>(
            future: stateFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(14),
                  child: Center(
                    child: SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text("Failed to load states"),
                );
              }

              final List<StateModel> states = snapshot.data ?? [];

              if (states.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text("No states available"),
                );
              }

              return DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(widget.hintText),
                  value: selectedStateId,
                  isExpanded: true,
                  items: states.map((state) {
                    return DropdownMenuItem<String>(
                      value: state.id.toString(),
                      child: Text(state.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => selectedStateId = value);
                    widget.onChangedStateId(value);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
