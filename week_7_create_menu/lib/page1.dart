import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page 1')),
      body: Center(
        child: Text('this is page 1', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
