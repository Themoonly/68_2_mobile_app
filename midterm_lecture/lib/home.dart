import 'package:flutter/material.dart';
import 'result.dart';

enum Department { INE, INET }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final midScore = TextEditingController();
  final finalScore = TextEditingController();
  final classScore = TextEditingController();

  Department? _department = Department.INE;
  String? _selectedItem = "COMP NET DESIGN & IMPLEMENT";
  List<String> dropdownmenu = [
    "MOBILE APPLICATION DEVELOPMENT",
    "FULL STACK SYSTEM DEVELOPMENT",
    "COMP NET DESIGN & IMPLEMENT",
    "DATABASE SYSTEM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Academic Grading',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildSectionCard(
                title: "Personal Information",
                child: Column(
                  children: [
                    _buildTextField(firstname, "First Name", Icons.badge),
                    const SizedBox(height: 16),
                    _buildTextField(
                      lastname,
                      "Last Name",
                      Icons.badge_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                title: "Academic Details",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Department",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        _buildRadio(Department.INE, "INE"),
                        _buildRadio(Department.INET, "INET"),
                      ],
                    ),
                    const Divider(height: 30),
                    const Text(
                      "Subject Name",
                      style: TextStyle(color: Colors.grey),
                    ),
                    DropdownButtonFormField(
                      initialValue: _selectedItem,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      items: dropdownmenu
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedItem = val),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                title: "Assessment Scores",
                child: Column(
                  children: [
                    _buildScoreField(
                      midScore,
                      "Midterm Exam (20%)",
                      Icons.edit_document,
                    ),
                    _buildScoreField(
                      finalScore,
                      "Final Exam (40%)",
                      Icons.assignment,
                    ),
                    _buildScoreField(
                      classScore,
                      "Classwork (40%)",
                      Icons.grade,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: Colors.teal.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyResult(
                          fname: firstname.text,
                          lname: lastname.text,
                          dept: _department!.name,
                          subject: _selectedItem!,
                          midterm: midScore.text,
                          finalScore: finalScore.text,
                          classwork: classScore.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'CALCULATE RESULT',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade900,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (val) => val!.isEmpty ? 'Required' : null,
    );
  }

  Widget _buildScoreField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, size: 20),
          suffixText: "/ 100",
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        validator: (val) => val!.isEmpty ? 'Enter score' : null,
      ),
    );
  }

  Widget _buildRadio(Department val, String title) {
    return Expanded(
      child: RadioListTile<Department>(
        value: val,
        groupValue: _department,
        title: Text(title, style: const TextStyle(fontSize: 14)),
        contentPadding: EdgeInsets.zero,
        onChanged: (v) => setState(() => _department = v),
      ),
    );
  }
}
