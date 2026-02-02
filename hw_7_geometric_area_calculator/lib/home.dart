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
  String selectedShap = '';

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

              SizedBox(width: 20),
              RadioListTile<String>(
                title: Text('Triangle'),
                value: 'Triangle',
                groupValue: selectedShap,
                onChanged: (value) {
                  setState(() {
                    selectedShap = value!;
                  });
                },
              ),

              SizedBox(width: 20),
              RadioListTile<String>(
                title: Text('Circle'),
                value: 'Circle',
                groupValue: selectedShap,
                onChanged: (value) {
                  setState(() {
                    selectedShap = value!;
                  });
                },
              ),

              if (selectedShap == 'Rectangle') ...[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  validator: validateNumber,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'width (cm)'),
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
                  child: Text('Calculator Area'),
                ),
              ],

              if (selectedShap == 'Triangle') ...[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  validator: validateNumber,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Base (cm)'),
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
                          builder: (context) => Tri(
                            height: double.parse(heightController.text),
                            base: double.parse(widthController.text),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Calculator Area'),
                ),
              ],

              if (selectedShap == 'Circle') ...[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Radius (cm)'),
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  validator: validateNumber,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Cir(radius: double.parse(heightController.text)),
                        ),
                      );
                    }
                  },
                  child: Text('Calculator Area'),
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
