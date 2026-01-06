import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber =
        random.nextInt(5) + 90; // Generates a number between 0 and 9

    return Scaffold(
      appBar: AppBar(title: Text("APP BAR")),
      body: Center(
        child: Text(randomNumber.toString(), style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
