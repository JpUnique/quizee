import 'question_model.dart';

class BaseQuestionModel {
  final String? questionType;
  final String? questionID;
  final List<QuestionModel>? questions;

  BaseQuestionModel({
    this.questionType,
    this.questionID,
    this.questions,
  });

  factory BaseQuestionModel.fromJson(Map<String, dynamic> json) =>
      BaseQuestionModel(
        questionType: json['questionType'],
        questionID: json['questionID'],
        questions: List<QuestionModel>.from(
          json['questions'].map((question) => QuestionModel.fromJson(question)),
        ),
      );
}
