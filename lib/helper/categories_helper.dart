import 'package:flutter/widgets.dart';
import 'package:trivi_arena/data/quizzes_list.dart';
import 'package:trivi_arena/views/quiz_info_view.dart';

class CategoriesHelper {
  static Widget getCategoryPage(int categoryIndex) {
    return switch (categoryIndex) {
      0 => QuizInfoView(quizModel: quizzes[0]),
      1 => QuizInfoView(quizModel: quizzes[1]),
      2 => QuizInfoView(quizModel: quizzes[2]),
      3 => QuizInfoView(quizModel: quizzes[3]),
      _ => QuizInfoView(quizModel: quizzes[4]),
    };
  }
}
