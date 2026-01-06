import 'package:classwork_6/shopping.dart';
import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _productName;
  final _productControllor = TextEditingController();

  void initState() {
    super.initState();
    _productControllor.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productControllor.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("INPUT FORM")),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                TextField(
                  controller: _productControllor,
                  // onChanged: (val) {
                  //   _updateText();
                  // },
                  decoration: InputDecoration(hintText: 'Product Name'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'costumer Name'),
                ),
                SizedBox(height: 20),
                myBtn(context),
                SizedBox(height: 20),
                Text("Product Name is : ${_productControllor.text}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton myBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return formshopping(productName: _productControllor.text);
            },
          ),
        );
      },
      child: Text("SUBMIT"),
    );
  }
}
