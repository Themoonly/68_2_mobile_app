import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "test cal2", home: Myhomepage());
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});
  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  String num1 = "";
  String num2 = "";
  String operator = "";
  String display = "0";

  Widget calcbtn(String textbtn, VoidCallback onPressedbtn) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: FloatingActionButton(
        onPressed: onPressedbtn,
        child: Text(textbtn, style: TextStyle(fontSize: 22)),
      ),
    );
  }

  // Function pressnumber
  void pressnumber(String value) {
    setState(() {
      if (operator.isEmpty) {
        num1 += value;
        display = num1;
      } else {
        num2 += value;
        display = num2;
      }
    });
  }

  void clear() {
    setState(() {
      num1 = "";
      num2 = "";
      operator = "";
      display = "0";
    });
  }

  void pressoperator(String op) {
    setState(() {
      operator = op;
    });
  }

  void calculator() {
    if (num1.isEmpty || num2.isEmpty || operator.isEmpty) return;

    double n1 = double.parse(num1);
    double n2 = double.parse(num2);
    double result = 0;

    switch (operator) {
      case "+":
        result = n1 + n2;
        break;
      case "-":
        result = n1 - n2;
        break;
      case "*":
        result = n1 * n2;
        break;
      case "/":
        result = n1 / n2;
        break;
    }
    setState(() {
      display = result.toString();
      num1 = result.toString();
      num2 = "";
      operator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(display, style: TextStyle(fontSize: 60, color: Colors.red)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcbtn("7", () => pressnumber("7")),
                calcbtn("8", () => pressnumber("8")),
                calcbtn("9", () => pressnumber("9")),
                calcbtn("+", () => pressoperator("+")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcbtn("4", () => pressnumber("4")),
                calcbtn("5", () => pressnumber("5")),
                calcbtn("6", () => pressnumber("6")),
                calcbtn("-", () => pressoperator("-")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcbtn("1", () => pressnumber("1")),
                calcbtn("2", () => pressnumber("2")),
                calcbtn("3", () => pressnumber("3")),
                calcbtn("*", () => pressoperator("*")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcbtn("0", () => pressnumber("0")),
                calcbtn("c", () => clear()),
                calcbtn("=", () => calculator()),
                calcbtn("/", () => pressoperator("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
