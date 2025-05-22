import 'dart:ui';

import 'package:flutter/widgets.dart';

class CategoryModel {
  final int id;
  final String name;
  final String iconPath;
  final Color color;

  CategoryModel({
    required this.id,
    required this.color,
    required this.name,
    required this.iconPath,
  });
}
