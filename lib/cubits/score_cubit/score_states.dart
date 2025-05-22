abstract class ScoreState {}

class ScoreInitial extends ScoreState {
  final int correctAnswers;
  ScoreInitial({this.correctAnswers = 0});
}
