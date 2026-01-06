import 'package:classwork_6/shopping.dart';
import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _productName;
  var _customerName;
  final _productControllor = TextEditingController();
  final _customerController = TextEditingController();

  void initState() {
    super.initState();
    _productControllor.addListener(_updateText);
    _customerController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productControllor.text;
      _customerName = _customerController.text;
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
                  decoration: InputDecoration(hintText: 'Product Name'),
                ),
                TextFormField(
                  controller: _customerController,
                  decoration: InputDecoration(labelText: 'costumer Name'),
                ),
                SizedBox(height: 20),
                myBtn(context),
                SizedBox(height: 20),
                Text(
                  "Product Name is : ${_productControllor.text}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Customer Name is : ${_customerController.text}",
                  style: TextStyle(fontSize: 20),
                ),
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
              return formshopping(productName: _productControllor.text, customerName: _customerController.text,);
            },
          ),
        );
      },
      child: Text("SUBMIT"),
    );
  }
}
