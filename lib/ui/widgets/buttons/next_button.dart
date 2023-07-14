import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../screens/quiz/quiz_view_model.dart';

class NextButton extends ViewModelWidget<QuestionViewModel> {
  const NextButton(this.callback, {Key? key}) : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context, model) {
    bool isLastQuestion = false;
    if (model.questionPos == model.questions.length - 1) {
      model.lockSelection = false;
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score

            showDialog(
                context: context,
                builder: (_) => _showScoreDialog(
                      model.questions.length,
                      model.score,
                      () {
                        model.resetVariables();
                        Navigator.pop(context);
                      },
                    ));
          } else {
            //next question
            model.nextquestion();
            callback.call();
          }
        },
      ),
    );
  }
}

_showScoreDialog(int questionLength, int score, VoidCallback onpress) {
  bool isPassed = false;

  if (score >= questionLength * 0.6) {
    //pass if 60 %
    isPassed = true;
  }
  String title = isPassed ? "Passed " : "Failed";

  return AlertDialog(
    title: Text(
      title + " | Score is $score",
      style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
    ),
    content: Builder(builder: (context) {
      return ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          onpress.call();
        },
      );
    }),
  );
}
