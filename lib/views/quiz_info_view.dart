import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/widgets/quiz/quiz_info_view_body.dart';

class QuizInfoView extends StatelessWidget {
  final QuizModel quizModel;
  const QuizInfoView({super.key, required this.quizModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: QuizInfoViewBody(quizModel: quizModel),
    );
  }
}
