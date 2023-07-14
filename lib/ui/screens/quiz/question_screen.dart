import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/base_question.dart';
import '../../../core/models/question_model.dart';
import '../../widgets/answer_widget.dart';
import '../../widgets/buttons/next_button.dart';
import '../../widgets/question_widget.dart';
import 'quiz_view_model.dart';

class QuestionsView extends StatefulWidget {
  final String questionType;
  const QuestionsView({super.key, required this.questionType});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getQuestionsStream() {
    var docQuery = FirebaseFirestore.instance
        .collection('Questions')
        .doc(widget.questionType)
        .snapshots();
    return docQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: SafeArea(
        child: StreamBuilder(
          stream: getQuestionsStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            var data = snapshot.data;
            BaseQuestionModel questionModel = BaseQuestionModel.fromJson(
                data!.data() as Map<String, dynamic>);
            return _QuestionScreenWidget(
              loadedQuestions: questionModel.questions!,
            );
          },
        ),
      ),
    );
  }
}

class _QuestionScreenWidget extends StatefulWidget {
  final List<QuestionModel> loadedQuestions;
  const _QuestionScreenWidget({Key? key, required this.loadedQuestions})
      : super(key: key);

  @override
  State<_QuestionScreenWidget> createState() => _QuestionScreenWidgetState();
}

class _QuestionScreenWidgetState extends State<_QuestionScreenWidget>
    with TickerProviderStateMixin {
  static const int maxSeconds = 60;
  int seconds = maxSeconds;
  late LinearTimerController timerController;
  bool timerActive = false;

  initState() {
    super.initState();
    timerController = LinearTimerController(this);
    Timer(Duration(milliseconds: 1000), () {
      if (mounted) {
        timerController.start(restart: true);
      }
    });
    setState(() {});
  }

  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  int timeUsed = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionViewModel>.reactive(
        viewModelBuilder: () => QuestionViewModel(),
        onViewModelReady: (model) => model.init(widget.loadedQuestions),
        builder: (context, model, _) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Stack(
                        children: [
                          SizedBox.expand(
                            child: LinearTimer(
                              duration: Duration(seconds: 30),
                              controller: timerController,
                              backgroundColor: Colors.orange,
                              color: Colors.red,
                              onUpdate: (){
                                setState(() {
                                  var convertedTime = (timerController.value * 60).roundToDouble();
                                  timeUsed = convertedTime.toInt();
                                });
                              },
                              onTimerEnd: () {
                                print("Timer stopped, move to next");
                                model.nextquestion();
                                if (model.questionPos <
                                    model.questions.length - 1) {
                                  timerController.reset();
                                  timerController.start(restart: true);
                                } else {
                                  timerController.stop();
                                }
                              },
                              forward: true,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Time ${timeUsed.round()}s",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                questionWidget(),
                AnswerWidget(() {
                  timerController.stop();
                }),
                NextButton(() {
                  timerController.reset();
                  timerController.start();
                })
                // _nextButton(),
              ],
            ),
          );
        });
  }
}
