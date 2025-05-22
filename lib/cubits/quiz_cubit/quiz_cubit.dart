import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/api/quiz_service.dart';
import 'package:trivi_arena/cubits/quiz_cubit/quiz_states.dart';
import 'package:trivi_arena/models/quiz_model.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  Future<void> getQuizQuestions({required QuizModel quiz}) async {
    try {
      emit(QuizLoading());

      final questions = await QuizService().getQuizQuestions(quiz: quiz);

      if (questions.isEmpty) {
        emit(QuizLoadFailure(errMessage: "No questions found for this quiz."));
      } else {
        emit(QuizLoadSuccess(questions: questions));
      }
    } catch (e) {
      debugPrint("Error in Getting Quiz Questions: $e");
      emit(QuizLoadFailure(errMessage: e.toString()));
    }
  }
}
