import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:stacked/stacked.dart';

import '../models/base_question.dart';
import '../models/question_model.dart';
import '../ui/styles/dimens.dart';
import '../ui/widgets/buttons/base_button.dart';
import '../ui/widgets/options_widget.dart';
import '../ui/widgets/question_widget.dart';
import 'quiz_view_model.dart';

class QuestionsView extends StatefulWidget {
  final String questionType;
  const QuestionsView({super.key, required this.questionType});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  late BaseQuestionModel questions;
  initState() {
    super.initState();
    // getQuestions();
  }

  // getQuestions() async {
  //   DocumentSnapshot<Map<String, dynamic>> data = await getQuestionsNotStream();
  //   questions = BaseQuestionModel.fromJson(data.data() as Map<String, dynamic>);
  //   print(questions.questions);
  // }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getQuestionsStream() {
    var docQuery = FirebaseFirestore.instance
        .collection('Questions')
        .doc(widget.questionType)
        .snapshots();
    return docQuery;
  }

  // Future<DocumentSnapshot<Map<String, dynamic>>> getQuestionsNotStream() async {
  //   var docQuery = await FirebaseFirestore.instance
  //       .collection('Questions')
  //       .doc(widget.questionType)
  //       .get();
  //   return docQuery;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return _QuestionViewWidget(
              loadedQuestions: questionModel.questions!,
            );
          },
        ),
      ),
    );
  }
}

class _QuestionViewWidget extends StatefulWidget {
  const _QuestionViewWidget({Key? key, required this.loadedQuestions})
      : super(key: key);
  final List<QuestionModel> loadedQuestions;

  @override
  State<_QuestionViewWidget> createState() => _QuestionViewWidgetState();
}

class _QuestionViewWidgetState extends State<_QuestionViewWidget> {
  PageController? controller;

  @override
  initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionViewModel>.reactive(
        viewModelBuilder: () => QuestionViewModel(),
        onViewModelReady: (model) => model.init(widget.loadedQuestions),
        builder: (context, model, _) {
          return WillPopScope(
            onWillPop: () async {
              if (model.questionPos != 0) {
                return await model.previousQuestion(controller!);
              } else if (model.questionPos == 0) {
                return await showDialog(
                      context: context,
                      builder: (context) => Container(),
                    ) ??
                    false;
              }
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                body: Container(
                  padding: Dimens.screenPadding,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.deepPurple],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: model.questionPos == 0
                                ? Colors.grey
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton.icon(
                          onPressed: () {
                            model.previousQuestion(controller!);
                           // Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                          ),
                          label: const Text(
                            'Previous',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          onPageChanged: (page) =>
                              model.updatePagePosition(page),
                            
                          itemCount: model.questions.length,
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                QuestionWidget(
                                  currentQuestion: model.questionPos,
                                  totalQuestion: model.questions.length,
                                  question: model.questions[index].question!,
                                ),
                                Container(
                                  child: OptionBox(
                                    question: model.questions[index],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      BaseButton(
                        bgColor: Colors.white,
                        onPress: () => model.nextQuestion(
                          controller!,
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        );
  }
}
