import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/question_cubit/question_states.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  int _currentQuestionIndex = -1;

  void loadQuestion() {
    _incrementQuestionIndex();
    emit(QuestionLoaded(questionIndex: _currentQuestionIndex));
  }

  void _incrementQuestionIndex() {
    _currentQuestionIndex++;
  }

  void reset() {
    _currentQuestionIndex = -1;
    emit(QuestionInitial());
  }
}
