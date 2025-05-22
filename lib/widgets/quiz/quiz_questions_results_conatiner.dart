import 'package:flutter/material.dart';

class QuizQuestionsResultsContainer extends StatelessWidget {
  final Color backgroundColor;
  final int numberOfQuestions;
  final String text;
  const QuizQuestionsResultsContainer({
    super.key,
    required this.backgroundColor,
    required this.numberOfQuestions,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$numberOfQuestions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
