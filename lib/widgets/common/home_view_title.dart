import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';

class HomeViewTitle extends StatelessWidget {
  const HomeViewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        RichText(
          text: TextSpan(
            text: "Welcome to ",
            style: TextStyle(fontSize: 18, color: kTextColor),
            children: [
              TextSpan(
                text: "TriviArena",
                style: TextStyle(
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Text(
          "Start your Adventure!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
