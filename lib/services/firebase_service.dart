import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../models/base_question.dart';

class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<Map<String, dynamic>> quizCollection;
  late CollectionReference<Map<String, dynamic>> userCollection;
  late DocumentReference<Map<String, dynamic>> questionType;

  static const String _questionsCollectionPath = 'Questions';
  static const String _usersCollectionPath = 'Users';
  static const String _questionTypePath = 'questionTypes';

  FirebaseService() {
    quizCollection = firestore.collection(_questionsCollectionPath);
    userCollection = firestore.collection(_usersCollectionPath);
    // questionType = firestore.doc(_questionTypePath);
  }

  uploadQuestions(quizMap) {
    quizMap.forEach((question, value) {
      quizCollection.doc(question).set(value);
    });
  }

  void create(String questionType) {
    quizCollection.doc();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> read() {
    return quizCollection.get();
  }

  void upload() async {
    var jsonFile = "assets/jsons/1st_quiz.json";
    String jsonString = await rootBundle.loadString(jsonFile);
    Map<String, dynamic> parsedJson = json.decode(jsonString);
    QuestionModel result = QuestionModel.fromJson(parsedJson);
    print(result.questions![0].options);
    DocumentReference reference =
        firestore.doc("$_questionsCollectionPath/" + result.questionType!);
    reference.set(parsedJson);
  }

  void delete() {}
}
