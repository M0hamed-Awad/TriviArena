import 'package:trivi_arena/data/quizzes_list.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/views/quiz_info_view.dart';

class QuizHelper {
  static QuizInfoView? getQuizInfoViewByCategoryId({required int categoryId}) {
    final QuizModel quiz = _getQuizByCategoryId(categoryId: categoryId);
    return QuizInfoView(quizModel: quiz);
  }

  static QuizModel _getQuizByCategoryId({required int categoryId}) {
    return switch (categoryId) {
      1 => quizzes[0], // General Knowledge
      2 => quizzes[1], // Sports
      3 => quizzes[2], // History
      4 => quizzes[3], // Geography
      5 => quizzes[4], // Arts
      _ => quizzes[5], // Animals
    };
  }

  static int getQuizCategoryIdByNameForApi(String categoryName) {
    return switch (categoryName) {
      "General Knowledge" => 9,
      "Sports" => 21,
      "Geography" => 22,
      "History" => 23,
      "Arts" => 25,
      "Animals" => 27,
      _ => -1,
    };
  }
}
