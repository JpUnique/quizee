import 'package:flutter/material.dart';
//import 'package:quizee/loginScreen/other_screen.dart/other_screen.dart';

import 'package:quizee/mainScreen/profile_screen/profile.dart';

import 'package:quizee/mainScreen/rbt_support/pdf_courses.dart';
import 'package:quizee/quiz/quiz_questions_list.dart';

import '../test_code/testtie.dart';

//import 'package:quizee/loginScreen/sign_me.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.genderImage,
  }) : super(key: key);

  final String genderImage;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final width = 130;

    final double progress;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * (1 / 3),
                color: Colors.white,
                child: TopBox(widget: widget),
              ),
              SizedBox(height: 7),
              Expanded(
                child: Container(
                  color: Colors.white54,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfCourses(
                                          genderImage: widget.genderImage)),
                                );
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/rbtcourses.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Wrap(children: [
                              Text(
                                'RBT Training Support \n Information ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizQuestionsListView(
                                        genderImage: widget.genderImage),
                                  ),
                                );
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/quizee.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Quizee',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExamplePage(
                                          genderImage: widget.genderImage),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/examples.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Examples',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBox extends StatelessWidget {
  const TopBox({
    super.key,
    required this.widget,
  });

  final MainScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  "Alias",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
                // SizedBox(height: 4),
                Text(
                  "Occupation",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Age',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                // SizedBox(width: 10),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      genderImage: widget.genderImage,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image(
                    fit: BoxFit.contain, image: AssetImage(widget.genderImage)),
                radius: 45,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 60,
                      width: 100,
                      child: Image.asset("assets/images/aba.jpeg")),
                  Container(
                      height: 80,
                      width: 100,
                      child: Image.asset("assets/images/ath.jpeg"))
                ]),
          ),
        ),
        SizedBox(height: 3),
        // LinearProgressIndicator(
        //   semanticsLabel: "ABA TRAINING COMPLETENESS",
        //   semanticsValue: '20',
        //   value: 0.3,
        //   minHeight: 20,
        // ),
        ProgressBar(
          height: 0.0,
          width: 0.0,
          progress: 0.1,
        )
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double progress;
  ProgressBar({
    super.key,
    required this.width,
    required this.height,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Container(
            width: width * progress,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white)),
        Align(
          alignment: Alignment.center,
          child: Text('${(progress * 100).toInt()}%',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }
}
