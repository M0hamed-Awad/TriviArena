import 'package:flutter/material.dart';
import 'package:trivi_arena/widgets/home/categories_grid.dart';
import 'package:trivi_arena/widgets/common/home_view_title.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          const HomeViewTitle(),
          SizedBox(height: 124),
          CategoriesGrid(),
        ],
      ),
    );
  }
}
