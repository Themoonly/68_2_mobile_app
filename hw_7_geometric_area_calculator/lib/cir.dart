import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';

class Cir extends StatelessWidget {
  final double radius;

  const Cir({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    double area = pi * pow(radius, 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Circle Area"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Radius: $radius'),
            SizedBox(height: 20),
            Text('Area: ${area.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
