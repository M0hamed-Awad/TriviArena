import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/widgets/quiz/quiz_questions_results_conatiner.dart';

class QuizStatsRow extends StatelessWidget {
  final int numberOfQuestions;
  final int numberOfCorrectQuestions;
  final int numberOfWrongQuestions;

  const QuizStatsRow({
    super.key,
    required this.numberOfQuestions,
    required this.numberOfCorrectQuestions,
    required this.numberOfWrongQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QuizQuestionsResultsContainer(
          backgroundColor: kDefaultColor,
          numberOfQuestions: numberOfQuestions,
          text: "Questions",
        ),
        QuizQuestionsResultsContainer(
          backgroundColor: kCorrectQuestionColor,
          numberOfQuestions: numberOfCorrectQuestions,
          text: "Correct",
        ),
        QuizQuestionsResultsContainer(
          backgroundColor: kWrongQuestionColor,
          numberOfQuestions: numberOfWrongQuestions,
          text: "Incorrect",
        ),
      ],
    );
  }
}
