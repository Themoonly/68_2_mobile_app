import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page 2')),
      body: Center(
        child: Text('this is page 2', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
