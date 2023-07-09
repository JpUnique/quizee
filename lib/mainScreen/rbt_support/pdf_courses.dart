import 'package:flutter/material.dart';

import 'package:quizee/mainScreen/rbt_support/model_pdf_courses.dart';
import 'package:quizee/mainScreen/rbt_support/reader_screen.dart';

import '../profile_screen/profile.dart';

class PdfCourses extends StatefulWidget {
  const PdfCourses({Key? key, required this.genderImage}) : super(key: key);

  final String genderImage;

  @override
  State<PdfCourses> createState() => _PdfCoursesState();
}

class _PdfCoursesState extends State<PdfCourses> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          // Root Parent Widget
          child: Column(children: [
            //Top Container
            TopContainer(screenHeight: screenHeight, widget: widget),
            //End of Top Container
            //
            //Expanded Container
            Expanded(
                child: Container(
              color: Colors.grey[400],
              child: SingleChildScrollView(
                child: Column(
                  children: Documents.doc_list
                      .map((doc) => Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20)),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReaderScreen(doc)));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Center(
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image: AssetImage(doc.images),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        doc.doc_titles!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )),
            //End of Expanded Container,
            //
          ]), //End of Root Parent
        ));
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    required this.screenHeight,
    required this.widget,
  });

  final double screenHeight;
  final PdfCourses widget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    builder: (context) => ProfileScreen(genderImage: widget.genderImage),
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
        ],
      ),
    );
  }
}
