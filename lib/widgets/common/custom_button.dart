import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color buttonTextColor;
  final String buttonText;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.buttonText,
    this.buttonTextColor = kTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
