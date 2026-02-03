import 'package:flutter/material.dart';

void main() {
  runApp(const GradeCalculator());
}

class GradeCalculator extends StatefulWidget {
  const GradeCalculator({super.key});

  @override
  State<GradeCalculator> createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController score1 = TextEditingController();
  final TextEditingController score2 = TextEditingController();
  final TextEditingController score3 = TextEditingController();
  final TextEditingController score4 = TextEditingController();

  String? selectedMajor = 'INE';
  String? selectSubject = 'Subject 1';
  String result = "";

  void calculatorGrade() {
    double s1 = double.tryParse(score1.text) ?? 0;
    double s2 = double.tryParse(score2.text) ?? 0;
    double s3 = double.tryParse(score3.text) ?? 0;
    double total = s1 + s2 + s3;
    String grade = "";

    if (total >= 80) {
      grade = "A";
    } else if (total >= 70)
      grade = "B";
    else if (total >= 60)
      grade = "C";
    else if (total >= 50)
      grade = "D";
    else
      grade = "F";

    setState(() {
      result =
          "ชื่อ: ${nameController.text}\n"
          "คะแนนรวม: $total\n"
          "เกรดที่ได้: $grade";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Application calculator grade")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "firstname - lastname"),
            ),

            Row(
              children: [
                Text("สาขา"),
                Radio(
                  value: "INE",
                  groupValue: selectedMajor,
                  onChanged: (val) {
                    setState(() {
                      selectedMajor = val;
                    });
                  },
                ),
                Text("INE"),
                Radio(
                  value: "INET",
                  groupValue: selectedMajor,
                  onChanged: (val) {
                    setState(() {
                      selectedMajor = val;
                    });
                  },
                ),
                Text("INET"),
              ],
            ),

            DropdownButton<String>(
              value: selectSubject,
              isExpanded: true,
              items: ["Subject 1", "Subject 2", "Subject 3", "Subject 4"].map((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) => setState(() => selectSubject = val ),
            ),

            TextField(controller: score1, decoration: InputDecoration(labelText: "คะแนนเก็บ"), keyboardType: TextInputType.number),
            TextField(controller: score2, decoration: InputDecoration(labelText: "คะแนนกลางภาค"), keyboardType: TextInputType.number),
            TextField(controller: score3, decoration: InputDecoration(labelText: "คะแนนปลายภาค"), keyboardType: TextInputType.number),
          
            SizedBox(height: 20,),

            ElevatedButton(onPressed: calculatorGrade, child: Text("calculator grade")),

            SizedBox(height: 20,),

            Text(result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
