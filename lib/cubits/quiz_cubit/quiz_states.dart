import 'package:trivi_arena/models/question_model.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoadSuccess extends QuizState {
  final List<QuestionModel> questions;
  QuizLoadSuccess({required this.questions});
}

class QuizLoadFailure extends QuizState {
  final String errMessage;
  QuizLoadFailure({required this.errMessage});
}
