abstract class AnswerState {}

class AnswerInitial extends AnswerState {}

class AnswersLoaded extends AnswerState {}

class AnswerSelected extends AnswerState {
  final String currentSelectedAnswer;

  AnswerSelected({required this.currentSelectedAnswer});
}

class AnswerSubmitted extends AnswerState {
  final String submittedAnswer;
  final String correctAnswer;

  AnswerSubmitted({required this.submittedAnswer, required this.correctAnswer});
}