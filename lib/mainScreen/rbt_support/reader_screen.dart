// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quizee/mainScreen/rbt_support/model_pdf_courses.dart';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ReaderScreen extends StatefulWidget {
  ReaderScreen(this.doc, {super.key});
  Documents doc;

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  // ignore: unused_field
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.doc.doc_titles!),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              // MaterialPageRoute(builder: (context) {
              //   MainScreen(genderImage: "assets/images/woman.jpeg");
              // });
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            child: PDF().cachedFromUrl(
          widget.doc.doc_url!,
          placeholder: (progress) => Center(child: Text("$progress %")),
          errorWidget: (error) => Center(child: Text(error.toString())),
        )));
  }
}
//  widget.doc.doc_url!