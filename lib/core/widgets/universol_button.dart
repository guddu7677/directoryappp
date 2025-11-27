import 'package:flutter/material.dart';

class UniversalButton extends StatelessWidget {
  final String title;              
  final Color textColor;           
  final VoidCallback onTap;        
  final Color? bgColor;            
  final Color? borderColor;       
  final double height;            
  final double borderRadius;       
  final double borderWidth;       

  const UniversalButton({
    super.key,
    required this.title,
    required this.textColor,
    required this.onTap,
    this.bgColor,
    this.borderColor,
    this.height = 55,
    this.borderRadius = 10,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
