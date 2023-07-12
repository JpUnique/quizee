import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/question_model.dart';
import 'quiz_view_model.dart';

class QuestionScreen extends StatefulWidget {
  final List<QuestionModel> loadedQuestions;
  const QuestionScreen({Key? key, required this.loadedQuestions}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  //define the datas
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool lockSelection = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionViewModel>.reactive(
        viewModelBuilder: () => QuestionViewModel(),
        onViewModelReady: (model) => model.init(widget.loadedQuestions),
        builder: (context, model, _) {
          return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Simple Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
    });
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
        children: List.generate(
      questionList[currentQuestionIndex].answersList!.length,
      (int index) => _answerButton(index),
    ).toList());
  }

  Widget _answerButton(int index) {
    // bool isSelected = answer == selectedAnswer;

    Color getColor() {
      if (lockSelection) {
        if (questionList[currentQuestionIndex].answersList![index] ==
            questionList[currentQuestionIndex].answer) {
          return Colors.green;
        } else if (questionList[currentQuestionIndex].answersList![index] !=
            questionList[currentQuestionIndex].answer) {
          return Colors.red;
        } else {
          return Colors.orange;
        }
      } else {
        return Colors.black;
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(questionList[currentQuestionIndex].answersList![index]),
            const CircleAvatar(
              radius: 10,
              child: Icon(
                Icons.done,
                size: 10,
              ),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.white,
            // primary: getSelectionColor(),
            // onPrimary: isSelected ? Colors.white : Colors.black,
            onPrimary:getColor(),
            // lockSelection
            //     ? questionList[currentQuestionIndex].answersList![index] ==
            //             questionList[currentQuestionIndex].answer
            //         ? Colors.green
            //         : Colors.red
            //     : Colors.black,
            disabledBackgroundColor: Colors.blueGrey),
        onPressed: lockSelection == true
            ? () {}
            : () {
                print("Start: $lockSelection");
                setState(() {
                  lockSelection = true;
                  selectedAnswer =
                      questionList[currentQuestionIndex].answersList![index];
                });
                if (lockSelection == true) {
                  if (selectedAnswer ==
                      questionList[currentQuestionIndex].answer) {
                    score++;
                  }
                  print("End of if function: $lockSelection");
                } else {
                  print("End of else, No nothing exec: $lockSelection");
                  return;
                }
                print("End of function: $lockSelection");
              },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      lockSelection = false;
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

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              lockSelection = false;
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Text(
        title + " | Score is $score",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
