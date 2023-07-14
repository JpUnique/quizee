class QuestionModel {
  // Creating a class named Question
  dynamic answer; // Declaring a string variable to store the answer
  List<String>? options; // Declaring a list of strings to store the options
  String? question; // Declaring a string variable to store the question

  QuestionModel({
    // Constructor for the class
    required this.answer, // Required parameter for the answer
    required this.options, // Required parameter for the options
    required this.question, // Required parameter for the question
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    // Factory constructor to create an instance of Question from JSON data
    return QuestionModel(
      // Returning an instance of Question
      answer: json['answer'], // Setting the answer from the JSON data
      options: List<String>.from(
          json['options']), // Setting the options from the JSON data
      question: json['question'], // Setting the question from the JSON data
    );
  }
}
