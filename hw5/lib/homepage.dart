import 'package:flutter/material.dart';
import 'dart:math';
import 'result.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final digit1 = TextEditingController();
  final digit2 = TextEditingController();
  final digit3 = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ระบบซื้อหวยสมชาย")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "กรอกเลข 3 หลักที่คุณต้องการซื้อ",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // จัดช่องว่างให้เท่ากัน
              children: [
                _buildNumberBox(digit1, "หลัก 1"),
                _buildNumberBox(digit2, "หลัก 2"),
                _buildNumberBox(digit3, "หลัก 3"),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "จำนวนเงินที่ซื้อ",
                suffixText: "บาท",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String win1 = Random().nextInt(10).toString();
                String win2 = Random().nextInt(10).toString();
                String win3 = Random().nextInt(10).toString();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      userNumber:
                          "${digit1.text}${digit2.text}${digit3.text}", // เลขที่ผู้ใช้พิมพ์
                      winNumber: "$win1$win2$win3", // เลขที่สุ่มได้ใหม่
                      price: amount.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("ซื้อหวย และ ตรวจรางวัล"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberBox(TextEditingController controller, String label) {
    return SizedBox(
      width: 70,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          counterText: "",
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
