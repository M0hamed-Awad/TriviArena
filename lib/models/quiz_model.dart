import 'package:trivi_arena/constants.dart';

class QuizModel {
  final int id;
  final String quizTitle;
  final String quizDescription;
  final int numberOfQuestions;
  final int categoryId;
  final QuizQuestionsType questionsType;
  final QuizQuestionsDifficulty questionsDifficulty;

  QuizModel({
    required this.questionsType,
    required this.questionsDifficulty,
    required this.id,
    required this.quizTitle,
    required this.quizDescription,
    required this.numberOfQuestions,
    required this.categoryId,
  });
}
