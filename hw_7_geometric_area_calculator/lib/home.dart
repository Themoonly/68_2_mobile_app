import 'package:flutter/material.dart';
import 'cir.dart';
import 'rec.dart';
import 'tri.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedShap = 'Rectangle';

  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final baseController = TextEditingController();
  final radiusController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    }
    if (double.tryParse(value) == null) {
      return "Please enter a valid number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geomatric area calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile<String>(
                title: Text('Rectangle'),
                value: 'Rectangle',
                groupValue: selectedShap,
                onChanged: (value) {
                  setState(() {
                    selectedShap = value!;
                  });
                },
              ),
              if (selectedShap == 'Rectangle') ...[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Height (h)'),
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  validator: validateNumber,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'width (h)'),
                  keyboardType: TextInputType.number,
                  controller: widthController,
                  validator: validateNumber,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Rec(
                            height: double.parse(heightController.text),
                            width: double.parse(widthController.text),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Calculator area'),
                ),
              ],
           //*
           //*
            ],
          ),
        ),
      ),
    );
  }
}
