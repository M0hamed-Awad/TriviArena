import 'package:trivi_arena/helper/api_helper.dart';
import 'package:trivi_arena/helper/categories_helper.dart';
import 'package:trivi_arena/helper/quiz_helper.dart';
import 'package:trivi_arena/models/question_model.dart';
import 'package:trivi_arena/models/quiz_model.dart';

class QuizService {
  final String baseURL = "https://opentdb.com/api.php";
  final List<String> requestFilters = [
    "amount",
    "category",
    "difficulty",
    "type",
  ];

  Future<List<QuestionModel>> getQuizQuestions({
    required QuizModel quiz,
  }) async {
    List<QuestionModel> questionsList = [];

    int quizCategoryId = QuizHelper.getQuizCategoryIdByNameForApi(
      CategoriesHelper.getCategoryModelById(categoryId: quiz.categoryId).name,
    );

    Map<String, dynamic> jsonData = await ApiHelper().get(
      url: baseURL,
      queryParameters: {
        requestFilters[0]: quiz.numberOfQuestions,
        requestFilters[1]: quizCategoryId,
        requestFilters[2]: quiz.questionsDifficulty.name,
        requestFilters[3]: quiz.questionsType.name,
      },
    );

    List<dynamic> questions = jsonData['results'];

    for (var question in questions) {
      questionsList.add(QuestionModel.fromJson(question, quiz.id));
    }

    return questionsList;
  }
}
