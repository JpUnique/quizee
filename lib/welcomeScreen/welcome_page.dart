// // import 'package:flutter/material.dart';
// // import 'package:quizee/loginScreen/login.dart';

// // class WelcomeScreen extends StatelessWidget {
// //   const WelcomeScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: true,
// //       body: SafeArea(
// //         child: Container(
// //           color: Colors.white,
// //           child: LayoutBuilder(
// //             builder: (context, constraints) {
// //               return SingleChildScrollView(
// //                 child: ConstrainedBox(
// //                   constraints: BoxConstraints(
// //                     minHeight: constraints.maxHeight,
// //                   ),
// //                   child: IntrinsicHeight(
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       crossAxisAlignment: CrossAxisAlignment.stretch,
// //                       children: [
// //                         Expanded(
// //                           child: Padding(
// //                             padding: EdgeInsets.symmetric(horizontal: 20),
// //                             child: Image.asset(
// //                               "assets/images/welcome/aba.png",
// //                               fit: BoxFit.contain,
// //                             ),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: Padding(
// //                             padding: EdgeInsets.symmetric(horizontal: 50),
// //                             child: Image.asset(
// //                               "assets/images/welcome/abaLogo2.png",
// //                               fit: BoxFit.contain,
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: 10),
// //                         Text(
// //                           "Therapy Group",
// //                           style: TextStyle(
// //                             fontSize: 40,
// //                             fontStyle: FontStyle.normal,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                           textAlign: TextAlign.center,
// //                         ),
// //                         SizedBox(height: 50),
// //                         Padding(
// //                           padding: EdgeInsets.all(8.0),
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               buildLanguageColumn(
// //                                 context,
// //                                 "CHOOSE LANGUAGE",
// //                                 "assets/images/welcome/english.png",
// //                               ),
// //                               buildLanguageColumn(
// //                                 context,
// //                                 "ESCOJA LENGUAJE",
// //                                 "assets/images/welcome/espanyol.png",
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Column buildLanguageColumn(
// //       BuildContext context, String title, String imagePath) {
// //     return Column(
// //       children: [
// //         Text(
// //           title,
// //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// //         ),
// //         InkWell(
// //           onTap: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => Login()),
// //             );
// //           },
// //           child: Container(
// //             child: Image.asset(
// //               imagePath,
// //               width: MediaQuery.of(context).size.width * 0.4,
// //               height: MediaQuery.of(context).size.height * 0.3,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:quizee/loginScreen/login.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return SingleChildScrollView(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minHeight: constraints.maxHeight,
//                   ),
//                   child: IntrinsicHeight(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Image.asset(
//                               "assets/images/welcome/aba.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 50,
//                             ),
//                             child: Image.asset(
//                               "assets/images/welcome/abaLogo2.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "Therapy Group",
//                           style: TextStyle(
//                             fontSize: 40,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 50),
//                         Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               buildLanguageColumn(
//                                 context,
//                                 "CHOOSE LANGUAGE",
//                                 "assets/images/welcome/english.png",
//                               ),
//                               buildLanguageColumn(
//                                 context,
//                                 "ESCOJA LENGUAJE",
//                                 "assets/images/welcome/espanyol.png",
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Column buildLanguageColumn(
//       BuildContext context, String title, String imagePath) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Login()),
//             );
//           },
//           child: Container(
//             child: Image.asset(
//               imagePath,
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: MediaQuery.of(context).size.height * 0.3,
//             ),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(
//               vertical:
//                   20), // Adjust the padding to move the text closer to the image
//           child: Text(
//             title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quizee/loginScreen/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    "assets/images/welcome/aba.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset(
                    "assets/images/welcome/abaLogo2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                "Therapy Group",
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildLanguageColumn(
                      context,
                      "CHOOSE LANGUAGE",
                      "assets/images/welcome/english.png",
                    ),
                    buildLanguageColumn(
                      context,
                      "ESCOJA LENGUAJE",
                      "assets/images/welcome/espanyol.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildLanguageColumn(
      BuildContext context, String title, String imagePath) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Column(
            children: [
              IntrinsicHeight(
                // padding: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 60, top: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
