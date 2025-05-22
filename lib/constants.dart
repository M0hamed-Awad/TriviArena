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
const Color kNaturalLightColor = Color(0xFFF1F1F1);
const Color kNaturalDarkColor = Color(0xFF1B1A1A);
const Color kLightGreyColor = Color(0xFFE3E3E3);
const Color kGreyColor = Color(0xFF7E7E7E);

// Light Theme Colors
const Color kLightBackgroundColor = kNaturalLightColor;
const Color kTextColorLight = kNaturalLightColor;
const Color kQuizInfoBackgroundColorLight = kNaturalLightColor;
const Color kQuestionBackgroundColorLight = kLightGreyColor;

// Dark Theme Colors
const Color kDarkBackgroundColor = kNaturalDarkColor;
const Color kTextColorDark = Color(0xFF333333);
const Color kQuizInfoBackgroundColorDark = kNaturalDarkColor;
const Color kQuestionBackgroundColorDark = Color(0xFF454647);

// Category Colors Light Theme
const Color kGeneralKnowledgeLightColor = Color(0xFF1AB4BC);
const Color kEntertainmentLightColor = Color(0xFF9B59B6);
const Color kScienceLightColor = Color(0xFF2ECC71);
const Color kSportsLightColor = Color(0xFFE67E22);
const Color kGeographyLightColor = Color(0xFF3498DB);
const Color kHistoryLightColor = Color(0xFFC0392B);
const Color kArtsLightColor = Color(0xFFE91E63);
const Color kAnimalsLightColor = Color(0xFF228B22);
const Color kDefaultLightColor = Color(0xFF607D8B);

// Category Colors Dark Theme
const Color kGeneralKnowledgeDarkColor = Color(0xFF096367);
const Color kEntertainmentDarkColor = Color(0xFF713689);
const Color kScienceDarkColor = Color(0xFF11733A);
const Color kSportsDarkColor = Color(0xFFB8510C);
const Color kGeographyDarkColor = Color(0xFF166396);
const Color kHistoryDarkColor = Color(0xFF8D2014);
const Color kArtsDarkColor = Color(0xFF930836);
const Color kAnimalsDarkColor = Color(0xFF0C3F0C);
const Color kDefaultDarkColor = Color(0xFF30414A);

// Quiz Question Colors
const Color kQuestionTimerBackgroundColor = Color(0xFF141412);
const Color kQuestionTimerProgressIndicatorColor = kSecondaryColor;
const Color kQuestionTimerProgressIndicatorBackgroundColor = Color(0xFF353535);

const Color kCorrectQuestionColor = Color(0xFF0BE19A);
const Color kWrongQuestionColor = Color(0xFFFE5D5D);
