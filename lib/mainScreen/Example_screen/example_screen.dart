import 'package:flutter/material.dart';

import '../profile_screen/profile.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key, required this.genderImage});
  
    final String genderImage;
  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children:[Container(
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
                            builder: (context) => ProfileScreen(genderImage: '',),
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
      Expanded(
        child: Container(
      color: Colors.grey[400],
      child: Column(children: []),
        ),
      )
      ])
    );
  }
}