import 'package:flutter/material.dart';

class Rec extends StatelessWidget {
  final double height;
  final double width;
  const Rec({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    double area = height * width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rectangle Area"),
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
            Text('width: $width'),
            SizedBox(height: 20),
            Text('Area: $area'),
          ],
        ),
      ),
    );
  }
}
