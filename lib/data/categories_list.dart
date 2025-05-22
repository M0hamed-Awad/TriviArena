import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/models/category_model.dart';

final List<CategoryModel> categories = [
  CategoryModel(
    id: 1,
    name: 'General Knowledge',
    iconPath:
        'assets/images/categories_icons/General-Knowledge-Category-Icon.png',
    color: kGeneralKnowledgeColor,
  ),
  CategoryModel(
    id: 2,
    name: 'Sports',
    iconPath: 'assets/images/categories_icons/Sports-Category-Icon.png',
    color: kSportsColor,
  ),
  CategoryModel(
    id: 3,
    name: 'History',
    iconPath: 'assets/images/categories_icons/History-Category-Icon.png',
    color: kHistoryColor,
  ),
  CategoryModel(
    id: 4,
    name: 'Geography',
    iconPath: 'assets/images/categories_icons/Geography-Category-Icon.png',
    color: kGeographyColor,
  ),
  CategoryModel(
    id: 5,
    name: 'Arts',
    iconPath: 'assets/images/categories_icons/Arts-Category-Icon.png',
    color: kArtsColor,
  ),
  CategoryModel(
    id: 6,
    name: 'Animals',
    iconPath: 'assets/images/categories_icons/Animals-Category-Icon.png',
    color: kAnimalsColor,
  ),
];
