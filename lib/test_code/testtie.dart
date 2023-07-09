import 'package:flutter/material.dart';

import '../examplescreen/example.dart';
import '../mainScreen/profile_screen/profile.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key, required this.genderImage}) : super(key: key);
  final String genderImage;
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Example",
      )),
      body: Column(children: [
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
                padding:
                    const EdgeInsets.only(bottom: 18.0, left: 15, right: 15),
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
        Expanded(
            child: Container(
          color: Colors.grey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ReUse(
                  image: ("assets/images/ICONforBRUSHTEETHEXAMPLE.jpg"),
                  text: 'Exaample 1: \n Brushing Teeth',
                ),
                SizedBox(height: 12),
                ReUse(
                    text: "Example 2: \n Potty Training",
                    image: ("assets/images/aba.jpeg")),
                SizedBox(height: 12),
                ReUse(
                    text: "Example 2: \n Potty Training",
                    image: ("assets/images/aba.jpeg"))
              ],
            ),
          ),
        )

            // SingleChildScrollView(
            //   child: Column(children: [

            //     Container(
            //       child: Row(children: [
            //         Container(), Text("", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ))
            //       ],),
            //         margin: EdgeInsets.only(bottom: 7),
            //         height: 100,
            //         color: Colors.transparent),
            //         Container(
            //       child: Row(children: [
            //         Container(), Text("", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ))
            //       ],),
            //         margin: EdgeInsets.only(bottom: 7),
            //         height: 100,
            //         color: Colors.transparent),
            //         Container(
            //       child: Row(children: [
            //         Container(), Text("", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ))
            //       ],),
            //         margin: EdgeInsets.only(bottom: 7),
            //         height: 100,
            //         color: Colors.transparent),
            //   ]),
            // )
            )
      ]),
    );
  }
}

class ReUse extends StatelessWidget {
  final String text;
  final String image;

  ReUse({
    super.key,
    required this.text,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
      height: 80,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ExampleScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Center(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  maxLines: 2,
                  text,
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
    );
  }
}

// Container(
//                             margin: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                                 color: Colors.blueGrey,
//                                 borderRadius: BorderRadius.circular(20)),
//                             height: 80,
//                             width: MediaQuery.of(context).size.width,
//                             padding: EdgeInsets.all(12),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             ReaderScreen(doc)));
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     height: 70,
//                                     width: 70,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(17),
//                                     ),
//                                     child: Center(
//                                       child: Image(
//                                         fit: BoxFit.contain,
//                                         image: AssetImage(doc.images),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 8.0),
//                                       child: Text(
//                                         doc.doc_titles!,
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontStyle: FontStyle.normal,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ))