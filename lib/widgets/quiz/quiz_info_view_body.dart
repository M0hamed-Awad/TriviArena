import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:trivi_arena/helper/categories_helper.dart';
import 'package:trivi_arena/helper/navigation_helper.dart';
import 'package:trivi_arena/models/category_model.dart';
import 'package:trivi_arena/models/quiz_model.dart';
import 'package:trivi_arena/views/quiz_questions_view.dart';

class QuizInfoViewBody extends StatelessWidget {
  const QuizInfoViewBody({super.key, required this.quizModel});

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    final CategoryModel category = CategoriesHelper.getCategoryModelById(
      categoryId: quizModel.categoryId,
    );

    final Color categoryColor = CategoriesHelper.getCategoryColor(
      context: context,
      categoryId: category.id,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: categoryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildQuizImage(imagePath: category.iconPath),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              decoration: _buildMainContainerBoxDecoration(context),
              child: _buildQuizInfoBody(
                context,
                quizModel: quizModel,
                categoryColor: categoryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizImage({required String imagePath}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image(image: AssetImage(imagePath)),
      ),
    );
  }

  BoxDecoration _buildMainContainerBoxDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color:
          isDark ? kQuizInfoBackgroundColorDark : kQuizInfoBackgroundColorLight,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    );
  }

  Widget _buildQuizInfoBody(
    BuildContext context, {
    required QuizModel quizModel,
    required Color categoryColor,
  }) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 8,
          children: _getQuizInfoBodyWidgetsList(
            context,
            quizModel: quizModel,
            categoryColor: categoryColor,
          ),
        ),
      ),
    );
  }

  List<Widget> _getQuizInfoBodyWidgetsList(
    BuildContext context, {
    required QuizModel quizModel,
    required Color categoryColor,
  }) {
    return <Widget>[
      const Text(
        'Are You Ready?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: kGreyColor),
      ),
      Text(
        quizModel.quizTitle,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Divider(color: categoryColor, thickness: 2, height: 16),
      const SizedBox(height: 4),
      _buildQuizDescriptionTitle(),
      _buildQuizDescriptionText(quizDescription: quizModel.quizDescription),
      const SizedBox(height: 24),
      _buildStartQuizButton(
        context,
        quizModel: quizModel,
        backgroundColor: categoryColor,
      ),
    ];
  }

  Widget _buildQuizDescriptionTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Description',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildQuizDescriptionText({required String quizDescription}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        quizDescription,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildStartQuizButton(
    BuildContext context, {
    required QuizModel quizModel,
    required Color backgroundColor,
  }) {
    return ElevatedButton(
      onPressed: () {
        _handleOnStartQuizButtonPressed(context, quizModel: quizModel);
      },
      style: _buildStartQuizButtonStyle(backgroundColor: backgroundColor),
      child: const Text(
        'Start Quiz',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _handleOnStartQuizButtonPressed(
    BuildContext context, {
    required QuizModel quizModel,
  }) {
    BlocProvider.of<QuizCubit>(context).getQuizQuestions(quiz: quizModel);

    NavigationHelper.pushReplacement(
      destination: QuizQuestionsView(quizModel: quizModel),
      context: context,
    );
  }

  ButtonStyle _buildStartQuizButtonStyle({required Color backgroundColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(64)),
    );
  }
}
