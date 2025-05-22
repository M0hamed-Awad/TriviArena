import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_cubit.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_states.dart';
import 'package:trivi_arena/cubits/score_cubit/score_cubit.dart';

class QuestionChoiceButton extends StatefulWidget {
  final String choice;
  const QuestionChoiceButton({super.key, required this.choice});

  @override
  State<QuestionChoiceButton> createState() => _QuestionChoiceButtonState();
}

class _QuestionChoiceButtonState extends State<QuestionChoiceButton> {
  Color buttonBackgroundColor = Colors.white;
  Color buttonTextColor = kPrimaryColor;
  Color buttonBorderColor = kPrimaryColor;
  bool isClickable = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnswerCubit, AnswerState>(
      listener: (context, state) {
        if (state is AnswerSelected) {
          isClickable = true;
          _handleOnButtonPressedUi(
            selectedAnswer: state.currentSelectedAnswer,
            choice: widget.choice,
          );
        } else if (state is AnswerSubmitted) {
          isClickable = false;
          _handleOnAnswerSubmittedUi(
            correctAnswer: state.correctAnswer,
            submittedAnswer: state.submittedAnswer,
            choice: widget.choice,
          );
        } else {
          buttonBorderColor = kPrimaryColor;
          buttonBackgroundColor = Colors.white;
          buttonTextColor = kPrimaryColor;
          isClickable = true;
        }
      },
      child: BlocBuilder<AnswerCubit, AnswerState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: _buildButtonBody(choice: widget.choice),
          );
        },
      ),
    );
  }

  void _handleOnButtonPressedUi({
    required String selectedAnswer,
    required String choice,
  }) {
    if (selectedAnswer == choice) {
      buttonBackgroundColor = kPrimaryColor;
      buttonTextColor = Colors.white;
    } else {
      buttonBackgroundColor = Colors.white;
      buttonTextColor = kPrimaryColor;
    }
  }

  void _handleOnAnswerSubmittedUi({
    required String correctAnswer,
    required String submittedAnswer,
    required String choice,
  }) {
    bool isSubmittedAnswerCorrect = (submittedAnswer == correctAnswer);
    bool isCurrentlySelected = (submittedAnswer == choice);
    bool isCurrentChoiceCorrect = (correctAnswer == choice);

    // Color Correct Answer
    if (isCurrentChoiceCorrect) {
      buttonBorderColor = Colors.green;
      buttonBackgroundColor = Colors.green;
      buttonTextColor = Colors.white;

      // Increase Score on Correct Answer
      if (isSubmittedAnswerCorrect && isCurrentlySelected) {
        BlocProvider.of<ScoreCubit>(context).incrementScore();
      }
    }
    // Color Wrong Answer
    else if (!isSubmittedAnswerCorrect && isCurrentlySelected) {
      buttonBorderColor = Colors.red;
      buttonBackgroundColor = Colors.red;
      buttonTextColor = Colors.white;
    }
    // Color Rest of the Answers with Default Colors
    else {
      buttonBorderColor = kPrimaryColor;
      buttonBackgroundColor = Colors.white;
      buttonTextColor = kPrimaryColor;
    }
  }

  OutlinedButton _buildButtonBody({required String choice}) {
    return OutlinedButton(
      onPressed:
          isClickable
              ? () => _handleOnAnswerSelected(context: context, choice: choice)
              : null,

      style: _buildButtonStyle(),
      child: _buildChoiceTextWidget(choice: choice),
    );
  }

  void _handleOnAnswerSelected({
    required BuildContext context,
    required String choice,
  }) {
    BlocProvider.of<AnswerCubit>(
      context,
    ).selectAnswer(currentSelectedAnswer: choice);
  }

  Text _buildChoiceTextWidget({required String choice}) {
    return Text(
      choice,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: buttonTextColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return OutlinedButton.styleFrom(
      backgroundColor: buttonBackgroundColor,
      elevation: 2,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      side: BorderSide(color: buttonBorderColor, width: 3.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
