import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_states.dart';

class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit() : super(AnswerInitial());

  void loadAnswers() {
    emit(AnswersLoaded());
  }

  void selectAnswer({required String currentSelectedAnswer}) {
    emit(AnswerSelected(currentSelectedAnswer: currentSelectedAnswer));
  }

  void submitAnswer({
    required String submittedAnswer,
    required String correctAnswer,
  }) {
    emit(
      AnswerSubmitted(
        submittedAnswer: submittedAnswer,
        correctAnswer: correctAnswer,
      ),
    );
  }

  void reset() => emit(AnswerInitial());
}
