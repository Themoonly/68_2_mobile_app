import 'package:flutter/material.dart';
import 'dart:ui';
import 'monney_box.dart';
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("text")),
      body: SafeArea(
        child: Padding(
          // ระยะขอบของ text ใน container
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MonneyBox("ยอดเงินคงเหลือ", 30000, 120, Colors.lightBlue),
              MonneyBox("รายรับ", 10000, 100, Colors.green),
              MonneyBox("ค่างจ่าย", 4000, 100, Colors.yellow.shade600),

            ],
          ),
        ),
      ),
    );
  }
}
