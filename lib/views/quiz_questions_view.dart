import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_cubit.dart';
import 'package:trivi_arena/cubits/question_cubit/question_cubit.dart';
import 'package:trivi_arena/cubits/score_cubit/score_cubit.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/widgets/quiz/quiz_questions_view_body.dart';

class QuizQuestionsView extends StatelessWidget {
  final QuizModel quizModel;

  const QuizQuestionsView({super.key, required this.quizModel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionCubit>(create: (context) => QuestionCubit()),
        BlocProvider<AnswerCubit>(create: (context) => AnswerCubit()),
        BlocProvider<ScoreCubit>(create: (context) => ScoreCubit()),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: QuizQuestionsViewBody(quizModel: quizModel),
        ),
      ),
    );
  }
}
