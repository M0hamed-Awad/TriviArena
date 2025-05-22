import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/question_cubit/question_cubit.dart';
import 'package:trivi_arena/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:trivi_arena/cubits/quiz_cubit/quiz_states.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/widgets/common/custom_loading_indicator.dart';
import 'package:trivi_arena/widgets/quiz/quiz_body.dart';

class QuizQuestionsViewBody extends StatefulWidget {
  final QuizModel quizModel;
  const QuizQuestionsViewBody({super.key, required this.quizModel});

  @override
  State<QuizQuestionsViewBody> createState() => _QuizQuestionsViewBodyState();
}

class _QuizQuestionsViewBodyState extends State<QuizQuestionsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        // Quiz Loaded Successfully
        if (state is QuizLoadSuccess) {
          BlocProvider.of<QuestionCubit>(context).loadQuestion();
          return QuizBody(
            quizModel: widget.quizModel,
            questions: state.questions,
          );
        }
        // Failed to Load Quiz
        else if (state is QuizLoadFailure) {
          return _buildFailureWidget();
        }
        // Loading
        else {
          return Center(
            child: SizedBox(
              width: 70,
              height: 70,
              child: CustomLoadingIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildFailureWidget() {
    return Center(
      child: Text(
        "Oops Something went wrong!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
