import 'package:flutter/material.dart';
import 'dart:ui';
import 'monney_box-6706022510395.dart';

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

class InputNew extends StatelessWidget {
  const InputNew({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'ชื่อเจ้าของบัญชี',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'โปรดระบุชื่อเจ้าของบัญชี';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
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
      appBar: AppBar(title: Text("text container")),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 120,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const InputNew(),
            ),
            MonneyBox("ยอดเงินคงเหลือ", 30000.59, 120, Colors.lightBlue, 20),
            MonneyBox("รายรับ", 10000.59, 100, Colors.green, 20),
            MonneyBox("รายจ่าย", 8000.59, 100, Colors.orange, 20),
            MonneyBox("ค่างจ่าย", 4000.59, 100, Colors.yellow.shade600, 20),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'submit',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
