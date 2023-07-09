import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../mainScreen/profile_screen/profile.dart';
import 'question_view.dart';

class QuizQuestionsListView extends StatefulWidget {
  const QuizQuestionsListView({Key? key, required this.genderImage})
      : super(key: key);
  final String genderImage;

  @override
  State<QuizQuestionsListView> createState() => _QuizQuestionsListViewState();
}

class _QuizQuestionsListViewState extends State<QuizQuestionsListView> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: screenHeight,
              child: Column(
                children: [
                  //Circular ProfileAvatar
                  IgnorePointer(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfileScreen(genderImage: widget.genderImage),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(top: 12, right: 15.0),
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
                    padding: const EdgeInsets.only(
                        bottom: 18.0, left: 15, right: 15),
                    child: LinearProgressIndicator(
                      semanticsLabel: "ABA TRAINING COMPLETENESS",
                      semanticsValue: '20',
                      value: 0.3,
                      minHeight: 12,
                    ),
                  ),
                ],
              ),
            ),
            //End of Top Container
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: new StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Questions")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: const CircularProgressIndicator());
                      else if (snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.active) {
                        return QuestionModel(snapshot);
                      } else
                        return new Text("There is no Documents");
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  QuestionModel(AsyncSnapshot<QuerySnapshot> snapshot) {
    var data = snapshot.data!.docs;
    var images = [
      "assets/images/chapterA.png",
      "assets/images/measure.png",
      "assets/images/assessment.png",
      "assets/images/skillone.png",
      "assets/images/skilltwo.png",
      "assets/images/behavior.png",
      "assets/images/glossary.png"
    ];
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        String image = images[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionsView(
                  questionType: data[index]['questionType'],
                ),
              ),
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Container(
              height: 80,
              margin: EdgeInsets.only(bottom: 6),
              padding: EdgeInsets.only(left: 8, top: 7, bottom: 7),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25)),
              child: ListTile(
                title: Text(
                  data[index]['questionType'],
                  style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                leading: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
