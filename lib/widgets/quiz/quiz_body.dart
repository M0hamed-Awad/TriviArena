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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        int currentQuestionIndex = 0;
        if (state is QuestionLoaded) {
          currentQuestionIndex = state.questionIndex;
        }
        // Final Question and go to Result Screen
        if (_isQuizFinished(
          quizNumberOfQuestions: widget.questions.length,
          currentQuestionIndex: currentQuestionIndex,
        )) {
          return _buildQuizResultsBody(quizModel: widget.quizModel);
        }
        // More Questions
        else {
          return _buildQuestionInfoBody(
            questions: widget.questions,
            currentQuestionIndex: currentQuestionIndex,
            quizModel: widget.quizModel,
          );
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

  bool _isQuizFinished({
    required int quizNumberOfQuestions,
    required int currentQuestionIndex,
  }) {
    int quizMaxIndex = quizNumberOfQuestions - 1;
    if (currentQuestionIndex > quizMaxIndex) {
      return true;
    } else {
      return false;
    }
  }
}
