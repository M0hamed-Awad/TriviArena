import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_cubit.dart';
import 'package:trivi_arena/cubits/question_cubit/question_cubit.dart';
import 'package:trivi_arena/cubits/score_cubit/score_cubit.dart';
import 'package:trivi_arena/helper/navigation_helper.dart';
import 'package:trivi_arena/views/home_view.dart';
import 'package:trivi_arena/widgets/common/custom_button.dart';
import 'package:trivi_arena/widgets/quiz/quiz_stats_row.dart';

class QuizResultsCard extends StatelessWidget {
  final int numberOfQuestions;
  const QuizResultsCard({super.key, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    final int numberOfCorrectQuestions =
        BlocProvider.of<ScoreCubit>(context).correctAnswers;
    final int numberOfWrongQuestions =
        numberOfQuestions - numberOfCorrectQuestions;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              _buildMainCard(
                context,
                numberOfQuestions: numberOfQuestions,
                numberOfCorrectQuestions: numberOfCorrectQuestions,
                numberOfWrongQuestions: numberOfWrongQuestions,
              ),
              _buildFinishQuizIcon(),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _buildFinishQuizIcon() {
    return Positioned(
      top: -120,
      left: 0,
      right: 0,
      child: Center(
        child: Image(
          image: AssetImage("assets/images/Finish-Quiz-Icon.png"),
          height: 240,
        ),
      ),
    );
  }

  Widget _buildMainCard(
    BuildContext context, {
    required int numberOfQuestions,
    required int numberOfCorrectQuestions,
    required int numberOfWrongQuestions,
  }) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(bottom: 16, top: 128, left: 8, right: 8),
        decoration: _buildMainContainerDecoration(),
        child: _buildFinishQuizCardBody(
          context,
          numberOfQuestions: numberOfQuestions,
          numberOfCorrectQuestions: numberOfCorrectQuestions,
          numberOfWrongQuestions: numberOfWrongQuestions,
        ),
      ),
    );
  }

  Widget _buildFinishQuizCardBody(
    BuildContext context, {
    required int numberOfQuestions,
    required int numberOfCorrectQuestions,
    required int numberOfWrongQuestions,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          "Your Score:",
          style: TextStyle(
            color: kTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${(numberOfCorrectQuestions * 10)}",
          style: TextStyle(
            color: kTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        QuizStatsRow(
          numberOfQuestions: numberOfQuestions,
          numberOfCorrectQuestions: numberOfCorrectQuestions,
          numberOfWrongQuestions: numberOfWrongQuestions,
        ),
        const SizedBox(height: 8),
        CustomButton(
          onTap: () {
            _handleOnFinishButtonClicked(context);
          },
          backgroundColor: const Color(0xFFFFA806),
          buttonText: "Finish",
          buttonTextColor: Colors.white,
        ),
      ],
    );
  }

  void _handleOnFinishButtonClicked(BuildContext context) {
    BlocProvider.of<QuestionCubit>(context).reset();
    BlocProvider.of<AnswerCubit>(context).reset();
    BlocProvider.of<ScoreCubit>(context).resetScore();
    NavigationHelper.pushReplacement(destination: HomeView(), context: context);
  }

  BoxDecoration _buildMainContainerDecoration() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 236, 247, 255),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          spreadRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
    );
  }
}
