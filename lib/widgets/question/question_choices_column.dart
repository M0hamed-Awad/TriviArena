import 'package:flutter/material.dart';
import 'package:trivi_arena/models/question_model.dart';
import 'package:trivi_arena/widgets/question/question_choice_button.dart';

class QuestionChoicesColumn extends StatefulWidget {
  final QuestionModel questionModel;
  const QuestionChoicesColumn({super.key, required this.questionModel});

  @override
  State<QuestionChoicesColumn> createState() => _QuestionChoicesColumnState();
}

class _QuestionChoicesColumnState extends State<QuestionChoicesColumn> {
  @override
  Widget build(BuildContext context) {
    return _buildQuestionChoicesBody(choices: _getChoicesList());
  }

  Widget _buildQuestionChoicesBody({required List<String> choices}) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            children: [
              QuestionChoiceButton(choice: choices[0]),
              QuestionChoiceButton(choice: choices[1]),
              QuestionChoiceButton(choice: choices[2]),
              QuestionChoiceButton(choice: choices[3]),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _getChoicesList() {
    final List<String> choices = widget.questionModel.wrongAnswers;
    choices.add(widget.questionModel.correctAnswer);
    choices.shuffle();
    return choices;
  }
}
