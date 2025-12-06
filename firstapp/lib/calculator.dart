import 'package:flutter/material.dart';

class CalculatorUI extends StatelessWidget {
  const CalculatorUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 2.5),
                child: Column(
                  children: [
                    buildButtonRow(
                      ["⌫", "AC", "%", "/"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["7", "8", "9", "x"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["4", "5", "6", "━"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["1", "2", "3", "+"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["+/-", "0", ".", "="],
                      isOperator: [false, false, false, true],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(
    List<String> labels, {
    required List<bool> isOperator,
    bool isDoubleZero = false,
  }) {
    return Expanded(
      child: Row(
        children: List.generate(labels.length, (index) {
          return Expanded(
            flex: (index == 0 && isDoubleZero) ? 2 : 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5),
              child: AspectRatio(
                aspectRatio: 1, // ทำให้ปุ่มเป็นสี่เหลี่ยมจัตุรัส → วงกลมได้
                child: Container(
                  decoration: BoxDecoration(
                    color: isOperator[index]
                        ? Colors.orange
                        : Colors.grey[850],
                    shape: BoxShape.circle, // ทำให้เป็นวงกลม
                  ),
                  child: Center(
                    child: Text(
                      labels[index],
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}