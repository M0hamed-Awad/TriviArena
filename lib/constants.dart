import 'package:flutter/widgets.dart';

// Quizzes Categories
const List<String> kMainCategoriesTitles = [
  'General Knowledge',
  'Sports',
  'Geography',
  'History',
  'Arts',
  'Animals',
];

// Quizzes Questions Properties
enum QuizQuestionsDifficulty { easy, medium, hard }

enum QuizQuestionsType { multiple, boolean }

// Main Colors
const Color kPrimaryColor = Color(0xFF4169E1);
const Color kSecondaryColor = Color(0xFFFFC107);
const Color kBackgroundColor = Color.fromARGB(255, 241, 241, 241);
const Color kTextColor = Color(0xFF333333);

// Category Colors
const Color kGeneralKnowledgeColor = Color(0xFF1AB4BC);
const Color kEntertainmentColor = Color(0xFF9B59B6);
const Color kScienceColor = Color(0xFF2ECC71);
const Color kSportsColor = Color(0xFFE67E22);
const Color kGeographyColor = Color(0xFF3498DB);
const Color kHistoryColor = Color(0xFFC0392B);
const Color kArtsColor = Color(0xFFE91E63);
const Color kAnimalsColor = Color(0xFF228B22);
const Color kDefaultColor = Color(0xFF607D8B);

// Quiz Question Colors
const Color kQuestionTimerBackgroundColor = Color(0xFF141412);
const Color kQuestionTimerProgressIndicatorColor = kSecondaryColor;
const Color kQuestionTimerProgressIndicatorBackgroundColor = Color(0xFF353535);

const Color kCorrectQuestionColor = Color(0xFF0BE19A);
const Color kWrongQuestionColor = Color(0xFFFE5D5D);
