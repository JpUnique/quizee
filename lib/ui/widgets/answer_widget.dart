import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../screens/quiz/quiz_view_model.dart';

class AnswerWidget extends ViewModelWidget<QuestionViewModel> {
  const AnswerWidget(this.callback, {Key? key}) : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context, model) {
    String correctAnswer = model.questions[model.questionPos].answer;

    return Column(
        children: List.generate(
      model.questions[model.questionPos].options!.length,
      (int index) => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 48,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(model.questions[model.questionPos].options![index])),
            ],
          ),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Colors.white,
              onPrimary: model.lockSelection
                  ? model.questions[model.questionPos].options![index] ==
                          correctAnswer
                      ? Colors.green
                      : Colors.red
                  : Colors.black,
              disabledBackgroundColor: Colors.blueGrey,
          ),
          onPressed:
              model.lockSelection == true ? () {} :(){
                model.execSelection(index);
                callback.call();
              },
        ),
      ),
    ).toList());
  }
}
