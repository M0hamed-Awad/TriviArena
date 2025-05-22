import 'package:html_unescape/html_unescape.dart';

class QuestionModel {
  final String questionText;
  final String correctAnswer;
  final List<String> wrongAnswers;
  final int quizId;

  QuestionModel({
    required this.questionText,
    required this.correctAnswer,
    required this.wrongAnswers,
    required this.quizId,
  });

  factory QuestionModel.fromJson(jsonData, int quizId) {
    final unescape = HtmlUnescape();
    return QuestionModel(
      questionText: unescape.convert(jsonData["question"]),
      correctAnswer: unescape.convert(jsonData["correct_answer"]),
      wrongAnswers: List<String>.from(
        jsonData['incorrect_answers'].map((e) => unescape.convert(e)),
      ),
      quizId: quizId,
    );
  }
}
