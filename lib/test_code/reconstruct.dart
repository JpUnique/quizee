import 'package:flutter/material.dart';
import 'package:quizee/test_code/ui_quiz.dart';

import '../mainScreen/profile_screen/profile.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.genderImage});
  final String genderImage;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height / 3;
    return Column(children: [
      Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            //Circular ProfileAvatar
            IgnorePointer(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(genderImage: widget.genderImage,),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 12, right: 15.0),
                      child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  filterQuality: FilterQuality.high,
                                  image: AssetImage(widget.genderImage)),
                              shape: BoxShape.circle,
                              color: Colors.grey[350]))),
                ),
              ),
            ),

            //Row Images
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 18, left: 35, top: 12, right: 35),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 30,
                          width: 100,
                          child: Image.asset(
                              filterQuality: FilterQuality.high,
                              "assets/images/aba.jpeg")),
                      Container(
                          height: 40,
                          width: 70,
                          child: Image.asset(
                              filterQuality: FilterQuality.high,
                              "assets/images/ath.jpeg"))
                    ]),
              ),
            ),

            //ProgressIndicator
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0, left: 15, right: 15),
              child: LinearProgressIndicator(
                semanticsLabel: "ABA TRAINING COMPLETENESS",
                semanticsValue: '20',
                value: 0.3,
                minHeight: 12,
              ),
            ),

            //
            Container(
                child: Column(
              children: [
                Text("Question 1",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(
                  "ABA is best when...",
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal),
                ),
                SizedBox(height: 10),
                OptionContainer(
                  text: "Structured yet Flexible",
                )
              ],
            ))
          ],
        ),
      )
    ]);
  }
}
