import 'package:flutter/material.dart';

class errorloader extends StatefulWidget {
  const errorloader({super.key});

  @override
  State<errorloader> createState() => _errorloaderState();
}

class _errorloaderState extends State<errorloader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Center(
            child: Column(children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Container(
                child: Center(
                  child: Text('traduciendo tu app al español',
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
