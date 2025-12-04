import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:directoryapp/core/widgets/header_item.dart';
import 'package:flutter/material.dart';

class TermConditions extends StatefulWidget {
  const TermConditions({super.key});

  @override
  State<TermConditions> createState() => _TermConditionsState();
}

class _TermConditionsState extends State<TermConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: BuildHeader(title: "Tearm & Conditions"),
      body: Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lorem Ipsum", style: AppTextStyle.Bold20black),
                  SizedBox(height: 12),

                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    style: AppTextStyle.normal20black,
                    textAlign: TextAlign.start,
                  ),

                  SizedBox(height: 25),
                  Text("Lorem Ipsum", style: AppTextStyle.Bold20black),
                  SizedBox(height: 12),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                    style: AppTextStyle.normal20black,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
