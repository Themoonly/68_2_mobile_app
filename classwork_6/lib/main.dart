import 'package:flutter/material.dart';
// import 'myhomepage.dart';
import 'input_form.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter ",
      // theme: ThemeData(colorScheme: .fromSeed(seedColor:)),
      home: const InputForm(),
    );
  }
}