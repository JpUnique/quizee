
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String? answer;
  List<String>? options;
  String? question;

  Question({
    this.answer,
    this.options,
    this.question,
  });

  factory Question.fromFirestore(DocumentSnapshot snapshot) {
    return Question(
      answer: snapshot['answer'],
      options: snapshot['options'].cast<String>(),
      question: snapshot['question'],
    );
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  final _db = FirebaseFirestore.instance;
  late Stream<List<Question>> questionsStream;

  @override
  void initState() {
    super.initState();
    questionsStream = _db.collection('Questions').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Question.fromFirestore(doc)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question App'),
      ),
      body: StreamBuilder<List<Question>>(
        stream: questionsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading questions'));
          } else {
            final questions = snapshot.data!;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return ListTile(
                  title: Text(question.question!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (question.options != null)
                        Text('Options: ${question.options!.join(',')}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
