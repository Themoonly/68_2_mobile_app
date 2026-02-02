import 'package:flutter/material.dart';

class Tri extends StatelessWidget {
  final double height;
  final double base;
  const Tri({required this.height, required this.base});

  @override
  Widget build(BuildContext context) {
    double area = 0.5 * height * base;
    return Scaffold(
      appBar: AppBar(
        title: Text("Triangle Area"),
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
            Text('Height: $height'),
            Text('base: $base'),
            SizedBox(height: 20),
            Text('Area: $area'),
          ],
        ),
      ),
    );
  }
}
