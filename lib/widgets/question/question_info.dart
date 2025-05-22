import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_cubit.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_states.dart';
import 'package:trivi_arena/cubits/question_cubit/question_cubit.dart';
import 'package:trivi_arena/models/question_model.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/widgets/question/question_card.dart';
import 'package:trivi_arena/widgets/question/question_choices_column.dart';
import 'package:trivi_arena/widgets/quiz/quiz_progress_bar.dart';
import 'package:trivi_arena/widgets/quiz/quiz_timer.dart';

class QuestionInfo extends StatelessWidget {
  final List<QuestionModel> questions;
  final int currentQuestionIndex;
  final QuizModel quizModel;
  const QuestionInfo({
    super.key,
    required this.questions,
    required this.currentQuestionIndex,
    required this.quizModel,
  });

  @override
  Widget build(BuildContext context) {
    return _buildQuestionInfoBody(
      currentQuestionIndex: currentQuestionIndex,
      context: context,
    );
  }

  Widget _buildQuestionInfoBody({
    required int currentQuestionIndex,
    required BuildContext context,
  }) {
    final QuestionModel question = questions[currentQuestionIndex];
    final int currentQuestionNumber = currentQuestionIndex + 1;

    BlocProvider.of<AnswerCubit>(context).loadAnswers();

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 8,
        children: _buildQuestionViewBodyWidgetsList(
          currentQuestionNumber: currentQuestionNumber,
          question: question,
          context: context,
        ),
      ),
    );
  }

  List<Widget> _buildQuestionViewBodyWidgetsList({
    required QuestionModel question,
    required int currentQuestionNumber,
    required BuildContext context,
  }) {
    return <Widget>[
      const SizedBox(height: 16),
      _buildQuizTitle(quizTitle: quizModel.quizTitle, context: context),
      const SizedBox(height: 4),
      QuizProgressBar(
        currentQuestionNumber: currentQuestionNumber,
        quizNumberOfQuestions: questions.length,
      ),
      const SizedBox(height: 46),
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          QuestionCard(questionText: question.questionText),
          Positioned(
            top: -40,
            child: QuizTimer(
              key: ValueKey(currentQuestionIndex),
              onTimeUp: () {
                // If time is over No Answer is Submitted
                BlocProvider.of<AnswerCubit>(context).submitAnswer(
                  submittedAnswer: "",
                  correctAnswer: question.correctAnswer,
                );
              },
            ),
          ),
        ],
      ),

      _buildQuizInfoRow(
        currentQuestionNumber: currentQuestionNumber,
        quiz: quizModel,
        context: context,
      ),

      const SizedBox(height: 20),

      QuestionChoicesColumn(questionModel: question),
      _buildQuizButton(correctAnswer: question.correctAnswer),
    ];
  }

  Widget _buildQuizTitle({
    required String quizTitle,
    required BuildContext context,
  }) {
    return Text(
      quizTitle,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildQuizInfoRow({
    required int currentQuestionNumber,
    required QuizModel quiz,
    required BuildContext context,
  }) {
    int quizNumberOfQuestions = quiz.numberOfQuestions;
    String quizDifficulty = quiz.questionsDifficulty.name;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "Question",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor,
                  ),
                  children: [
                    TextSpan(
                      text: " $currentQuestionNumber of $quizNumberOfQuestions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            RichText(
              text: TextSpan(
                text: "Difficulty:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kGreyColor,
                ),
                children: [
                  TextSpan(
                    text: " $quizDifficulty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 36),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizButton({required String correctAnswer}) {
    return BlocBuilder<AnswerCubit, AnswerState>(
      builder: (context, state) {
        String buttonText = _changeButtonText(state: state);

        return SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              _handleOnQuizButtonClicked(
                state: state,
                context: context,
                correctAnswer: correctAnswer,
              );
            },
            style: _buildQuizButtonStyle(),
            child: _buildQuizButtonTextWidget(buttonText: buttonText),
          ),
        );
      },
    );
  }

  void _handleOnQuizButtonClicked({
    required AnswerState state,
    required BuildContext context,
    required String correctAnswer,
  }) {
    if (state is AnswerSelected) {
      String submittedAnswer = state.currentSelectedAnswer;

      BlocProvider.of<AnswerCubit>(context).submitAnswer(
        submittedAnswer: submittedAnswer,
        correctAnswer: correctAnswer,
      );
    } else if (state is AnswerSubmitted) {
      BlocProvider.of<QuestionCubit>(context).loadQuestion();
    }
  }

  String _changeButtonText({required AnswerState state}) {
    if (state is AnswerSelected) {
      return "Submit";
    } else if (state is AnswerSubmitted) {
      return "Next";
    } else {
      return "Submit";
    }
  }

  ButtonStyle _buildQuizButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFEB8A03),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(64)),
    );
  }

  Text _buildQuizButtonTextWidget({required String buttonText}) {
    return Text(
      buttonText,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
