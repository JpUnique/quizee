import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../models/question_model.dart';
import '../../quiz/quiz_view_model.dart';
import '../styles/colors.dart';

class OptionBox extends ViewModelWidget<QuestionViewModel> {
  final String? text;
  final QuestionModel question;

  const OptionBox({Key? key, this.text, required this.question});

  @override
  Widget build(BuildContext context, viewModel) {
    Color wrongAnswer = AppColor.wrongAnswer;
    Color rightAnswer = AppColor.rightAnswer;
    Color unselectedAnswer = AppColor.unselectedAnswer;
    Color selectedBtnColor = Colors.white;
    String option(index) => question.options![index];
    // bool isSelected(index) =>
    //     viewModel.selectedOption == question.options![index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        viewModel.questions[viewModel.questionPos].options!.length,
        (index) => GestureDetector(
          onTap: viewModel.isAnswered == false
              ? () {
                  viewModel.updateSelectedAnswer(
                    option: viewModel
                        .questions[viewModel.questionPos].options![index],
                    correctAnswer: question.answer,
                  );
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              color: _getColor(viewModel.isAnswered,viewModel.selectedOption,question.answer),
              borderRadius: BorderRadius.circular(10),
              border: _getBorder(viewModel.isAnswered,viewModel.selectedOption,question.answer)),
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(option(index))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1, 1),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ],
                  ),
                  child: viewModel.isAnswered
                      ? const CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 12,
                          ),
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color _getColor(
  bool isSelected, [
  String? option,
  String? correctOption,
]) {
  if (isSelected == true) {
    if (correctOption == option)
      return Colors.green;
    else
      return Colors.red;
  } else {
    return Colors.white;
  }
}

Border _getBorder(
  bool isSelected, [
  String? option,
  String? correctOption,
]) {
  if (isSelected == true) {
    if (correctOption == option)
      return Border.all(
                      color: Colors.green,
                      style: BorderStyle.solid,
                      width: 2,
                    ); 
    else
      return Border.all(
                      color: Colors.red,
                      style: BorderStyle.none,
                      width: 0,
                    );
  } else {
    return Border.all(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                      width: 0,
                    );;
  }
}
