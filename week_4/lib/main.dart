import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "cw2", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String num1 = "";
  String num2 = "";
  double result = 0;
  String operator = "";
  String showval = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(showval, style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "7";
                        showval = num1;
                      } else {
                        num2 += "7";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("7", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "8";
                        showval = num1;
                      } else {
                        num2 += "8";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("8", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "9";
                        showval = num1;
                      } else {
                        num2 += "9";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("9", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "+";
                  },
                  child: Text("+", style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "4";
                        showval = num1;
                      } else {
                        num2 += "4";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("4", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "5";
                        showval = num1;
                      } else {
                        num2 += "5";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("5", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "6";
                        showval = num1;
                      } else {
                        num2 += "6";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("6", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "-";
                  },
                  child: Text("-", style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "1";
                        showval = num1;
                      } else {
                        num2 += "1";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("1", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "2";
                        showval = num1;
                      } else {
                        num2 += "2";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("2", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "3";
                        showval = num1;
                      } else {
                        num2 += "3";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("3", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "*";
                  },
                  child: Text("*", style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "0";
                        showval = num1;
                      } else {
                        num2 += "0";
                        showval = num2;
                      }
                    });
                  },
                  child: Text("0", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      num1 = "";
                      num2 = "";
                      operator = "";
                      showval = "0";
                    });
                  },
                  child: Text("c", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (num1 == "" || num2 == "") return;
                      if (operator == "+") {
                        result = double.parse(num1) + double.parse(num2);
                      } else if (operator == "-") {
                        result = double.parse(num1) - double.parse(num2);
                      } else if (operator == "*") {
                        result = double.parse(num1) * double.parse(num2);
                      } else if (operator == "/") {
                        result = double.parse(num1) / double.parse(num2);
                      } else if (operator == "\u221A") {
                        result = sqrt(double.parse(num1));
                      } else if (operator == "^") {
                        result = pow(
                          double.parse(num1),
                          double.parse(num2),
                        ).toDouble();
                      } else if (operator == "%") {
                        result =
                            (double.parse(num1) * double.parse(num2) / 100);
                      }
                      showval = result.toString();
                      num1 = result.toString();
                      num2 = "";
                      operator = "";
                    });
                  },
                  child: Text("=", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "/";
                  },
                  child: Text("/", style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // operator = "del";
                    setState(() {
                      if (showval.length > 1) {
                        showval = showval.substring(0, showval.length - 1);
                      } else if (showval.length == 1 && showval != "0") {
                        showval = "0";
                      }
                      if (operator.isEmpty) {
                        num1 = showval;
                      } else {
                        num2 = showval;
                      }
                      if (showval == "0") {
                        if (operator.isEmpty) {
                          num1 = "";
                        } else {
                          num2 = "";
                        }
                      }
                    });
                  },
                  child: Text("del", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "%";
                  },
                  child: Text("%", style: TextStyle(fontSize: 30)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "^";
                  },
                  child: Text("^", style: TextStyle(fontSize: 40)),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    operator = "\u221A";
                    setState(() {
                      if (num1.isNotEmpty) {
                        double n1 = double.parse(num1);
                        if (n1 >= 0) {
                          result = sqrt(n1);

                          showval = result.toString();
                          num1 = result.toString();
                          num2 = "";
                          operator = "";
                        } else {
                          showval = "Error (Negative)";
                          num1 = "";
                          num2 = "";
                          operator = "";
                        }
                      }
                    });
                  },
                  child: Text("\u2713", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
