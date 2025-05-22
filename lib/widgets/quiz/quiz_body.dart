import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/question_cubit/question_cubit.dart';
import 'package:trivi_arena/cubits/question_cubit/question_states.dart';
import 'package:trivi_arena/models/question_model.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/widgets/question/question_info.dart';
import 'package:trivi_arena/widgets/quiz/quiz_results_card.dart';

class QuizBody extends StatefulWidget {
  final QuizModel quizModel;
  final List<QuestionModel> questions;
  const QuizBody({super.key, required this.quizModel, required this.questions});

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        // Final Question and go to Result Screen
        if (_isFinalQuestion(
          quizNumberOfQuestions: widget.questions.length,
          currentQuestionIndex: currentQuestionIndex,
        )) {
          currentQuestionIndex = 0;
          return _buildQuizResultsBody(quizModel: widget.quizModel);
        }
        // More Questions
        if (state is QuestionLoaded) {
          currentQuestionIndex = state.questionIndex;
          return _buildQuestionInfoBody(
            questions: widget.questions,
            currentQuestionIndex: state.questionIndex,
            quizModel: widget.quizModel,
          );
        }
        // Quiz is Completed
        else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildQuizResultsBody({required QuizModel quizModel}) {
    return QuizResultsCard(numberOfQuestions: quizModel.numberOfQuestions);
  }

  Widget _buildQuestionInfoBody({
    required List<QuestionModel> questions,
    required int currentQuestionIndex,
    required QuizModel quizModel,
  }) {
    return QuestionInfo(
      questions: questions,
      currentQuestionIndex: currentQuestionIndex,
      quizModel: quizModel,
    );
  }

  bool _isFinalQuestion({
    required int quizNumberOfQuestions,
    required int currentQuestionIndex,
  }) {
    int quizMaxIndex = quizNumberOfQuestions - 1;
    if (currentQuestionIndex >= quizMaxIndex) {
      return true;
    } else {
      return false;
    }
  }
}
