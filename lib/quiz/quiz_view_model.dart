import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/question_model.dart';

class QuestionViewModel extends BaseViewModel {
  int questionPos = 0;
  List<QuestionModel> questions = [];
  String? selectedOption;
   bool isAnswered = false;

  //define the datas
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool lockSelection = false;

  List<String> option = [];

  updatePagePosition(int currentPos) {
    questionPos = currentPos;
    notifyListeners();
  }

  previousQuestion(PageController controller) {
    if (questionPos != questions.length - 1) {
      controller.animateToPage(--questionPos,
          duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
    }
  }

  onSave() {
    option.add(selectedOption!);
  }

  nextQuestion(PageController controller, BuildContext context) {
    if (questionPos < questions.length) {
      onSave();
      controller.animateToPage(++questionPos,
          duration: const Duration(milliseconds: 20), curve: Curves.bounceIn);
    } else {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ResultView(result: option,)));
    }
    // debugPrint('Debug print ${option[questionPos]}');
    option.clear();
  }

  updateSelectedAnswer({required String option, required String correctAnswer}) {
    selectedOption = option;
    if(correctAnswer == selectedOption){
       isAnswered = true;
       notifyListeners();
    } else { 
      isAnswered = true;
       notifyListeners();
    }
  }

  init(loadedQuestion) {
    questions = loadedQuestion;
  }
}
