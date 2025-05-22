import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      color: kPrimaryColor,
      strokeWidth: 8,
      strokeCap: StrokeCap.round,
    );
  }
}
