import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/score_cubit/score_states.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreInitial());

  int _correctAnswers = 0;

  void incrementScore() {
    _correctAnswers++;
    emit(ScoreInitial(correctAnswers: _correctAnswers));
  }

  void resetScore() {
    _correctAnswers = 0;
    emit(ScoreInitial(correctAnswers: 0));
  }

  int get correctAnswers => _correctAnswers;
}
