import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final List<String> items = [
    "1.- Use a children's toothbrush",
    "2.- Use the right amount of toothpaste",
    "3.- Place a ladder so that the child can reach the sink",
    "4.- Stand behind them to help",
    "5.- Have them hold the toothbrush with you.",
    "6.- Always stand in front of a mirror.",
    "7.- Brush gently in circles.",
    "8.- Clean the teeth inside and out.",
    "9.- Don't forget the external side.",
    "10.- Allow them to spit out the excess toothpaste"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Brushing your teeth")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              
              decoration: BoxDecoration(
                
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(items[index]),
              ),
            ),
          ),
        ));
  }
}
