import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;
  const QuestionCard({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 200,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 48.0,
        bottom: 32.0,
      ),
      decoration: BoxDecoration(
        color:
            isDark
                ? kQuestionBackgroundColorDark
                : kQuestionBackgroundColorLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            questionText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
