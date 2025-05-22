import 'package:flutter/material.dart';
import 'package:trivi_arena/data/quizzes_list.dart';
import 'package:trivi_arena/helper/navigation_helper.dart';
import 'package:trivi_arena/helper/quiz_helper.dart';
import 'package:trivi_arena/models/category_model.dart';
import 'package:trivi_arena/views/quiz_info_view.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleOnCategoryItemClicked(context),
      child: _buildCategoryCard(categoryModel: category),
    );
  }

  Card _buildCategoryCard({required CategoryModel categoryModel}) {
    return Card(
      color: categoryModel.color,
      elevation: 3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildCategoryIconWidget(categoryIconPath: categoryModel.iconPath),
          Center(
            child: _buildCategoryContainer(categoryTitle: categoryModel.name),
          ),
        ],
      ),
    );
  }

  Positioned _buildCategoryIconWidget({required String categoryIconPath}) {
    return Positioned(
      top: -60,
      left: 0,
      right: 0,
      child: Center(
        child: Image(
          image: AssetImage(categoryIconPath),
          height: 90,
          width: 90,
        ),
      ),
    );
  }

  Container _buildCategoryContainer({required String categoryTitle}) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 36.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      width: 140,
      child: Text(
        categoryTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  void _handleOnCategoryItemClicked(BuildContext context) {
    return NavigationHelper.push(
      destination:
          // Navigate to Quiz Info View with the corresponding Quiz Info
          QuizHelper.getQuizInfoViewByCategoryId(categoryId: category.id) ??
          QuizInfoView(quizModel: quizzes[0]),
      context: context,
    );
  }
}
