import 'package:flutter/material.dart';
import 'package:trivi_arena/data/categories_list.dart';
import 'package:trivi_arena/widgets/home/category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 64.0,
          crossAxisSpacing: 8.0,
          mainAxisExtent: 80,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index]);
        },
      ),
    );
  }
}
