import 'package:stacked/stacked.dart';

import '../../../core/models/question_model.dart';

class QuestionViewModel extends BaseViewModel {
  //define the datas
  int questionPos = 0;
  List<QuestionModel> questions = [];

  int score = 0;
  String? selectedAnswer;
  bool lockSelection = false;

  init(loadedQuestion) {
    questions = loadedQuestion;
    notifyListeners();
  }

  execSelection(index) {
    print("Start: $lockSelection");
      lockSelection = true;
      selectedAnswer = questions[questionPos].options![index];
      notifyListeners();
    if (lockSelection == true) {
      if (selectedAnswer == questions[questionPos].answer) {
        score++;
        notifyListeners();
      }
      print("End of if function: $lockSelection");
    } else {
      print("End of else, No nothing exec: $lockSelection");
      return;
    }
    print("End of function: $lockSelection");
    notifyListeners();
  }

  void nextquestion() {
    lockSelection = false;
    selectedAnswer = null;
    questionPos++;
    notifyListeners();
  }

  resetVariables() {
    questionPos = 0;
    score = 0;
    selectedAnswer = null;
    notifyListeners();
  }
}
