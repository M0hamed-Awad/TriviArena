abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final int questionIndex;

  QuestionLoaded({required this.questionIndex});
}
