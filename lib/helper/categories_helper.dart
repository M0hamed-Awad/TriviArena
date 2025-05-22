import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/data/categories_list.dart';
import 'package:trivi_arena/models/category_model.dart';

class CategoriesHelper {
  static CategoryModel getCategoryModelById({required int categoryId}) {
    return switch (categoryId) {
      1 => categories[0],
      2 => categories[1],
      3 => categories[2],
      4 => categories[3],
      5 => categories[4],
      _ => categories[5],
    };
  }

  static Color getCategoryColor({
    required BuildContext context,
    required int categoryId,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return switch (categoryId) {
      1 => isDark ? kGeneralKnowledgeDarkColor : kGeneralKnowledgeLightColor,
      2 => isDark ? kSportsDarkColor : kSportsLightColor,
      3 => isDark ? kHistoryDarkColor : kHistoryLightColor,
      4 => isDark ? kGeographyDarkColor : kGeographyLightColor,
      5 => isDark ? kArtsDarkColor : kArtsLightColor,
      _ => isDark ? kAnimalsDarkColor : kAnimalsLightColor,
    };
  }
}
