import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/models/quiz_model.dart';

final List<QuizModel> quizzes = [
  QuizModel(
    id: 1,
    quizTitle: "General Knowledge Quiz",
    quizDescription:
        "Test your knowledge across various topics! A mix of fun and tricky questions to challenge your thinking.",
    numberOfQuestions: 15,
    categoryId: 1,
    questionsDifficulty: QuizQuestionsDifficulty.hard,
    questionsType: QuizQuestionsType.multiple,
  ),
  QuizModel(
    id: 2,
    quizTitle: "Sports Fanatic",
    quizDescription:
        "Are you a true sports enthusiast? Answer questions on teams, players, and records.",
    numberOfQuestions: 10,
    categoryId: 2,
    questionsDifficulty: QuizQuestionsDifficulty.medium,
    questionsType: QuizQuestionsType.multiple,
  ),
  QuizModel(
    id: 3,
    quizTitle: "History Buff",
    quizDescription:
        "From ancient civilizations to modern events, how much do you know about history?",
    numberOfQuestions: 12,
    categoryId: 3,
    questionsDifficulty: QuizQuestionsDifficulty.medium,
    questionsType: QuizQuestionsType.multiple,
  ),
  QuizModel(
    id: 4,
    quizTitle: "Geography Explorer",
    quizDescription:
        "Travel the world through this quiz! Test your knowledge of countries, capitals, and landmarks.",
    numberOfQuestions: 15,
    categoryId: 4,
    questionsDifficulty: QuizQuestionsDifficulty.easy,
    questionsType: QuizQuestionsType.multiple,
  ),
  QuizModel(
    id: 5,
    quizTitle: "Arts & Creativity",
    quizDescription:
        "Explore painting, literature, and artistic movements throughout history.",
    numberOfQuestions: 12,
    categoryId: 5,
    questionsDifficulty: QuizQuestionsDifficulty.easy,
    questionsType: QuizQuestionsType.multiple,
  ),
  QuizModel(
    id: 6,
    quizTitle: "Animals & Wildlife",
    quizDescription:
        "Discover fascinating facts about creatures of the land, sky, and sea!",
    numberOfQuestions: 10,
    categoryId: 6,
    questionsDifficulty: QuizQuestionsDifficulty.hard,
    questionsType: QuizQuestionsType.multiple,
  ),
];
