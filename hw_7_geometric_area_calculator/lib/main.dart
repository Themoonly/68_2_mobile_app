import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geometric Area Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}
