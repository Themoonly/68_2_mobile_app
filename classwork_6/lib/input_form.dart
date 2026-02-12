// import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';
import 'package:classwork_6/shopping.dart';
import 'package:flutter/material.dart';

enum ProductTypeEnum { Downloadable, Deliverable, Onshop, Reserver }

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _productName;
  var _customerName;
  final _productControllor = TextEditingController();
  final _productDecController = TextEditingController();

  var _selectedChoice;

  bool? _checkBox, _listTitleCheckBox = false;

  final _productSizeList = ['small', 'Medium', 'Large', 'XLarge'];
  String? _selectedVal = "";

  void _MyFormState() {
    _selectedVal = _productSizeList[0];
  }

  ProductTypeEnum? _productTypeEnum;

  @override
  void initState() {
    super.initState();
    _productControllor.addListener(_updateText);
    _productDecController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productControllor.text;
      _customerName = _productDecController.text;
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
                const Text("product app", style: TextStyle(fontSize: 30)),
                const Text("add product detail in the form"),
                SizedBox(height: 20.0),
                MytextField(
                  fieldName: 'Product Name',
                  mycontroller: _productControllor,
                  myIcon: Icons.shopping_cart,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                SizedBox(height: 10.0),
                MytextField(
                  fieldName: 'Product Description',
                  mycontroller: _productDecController,
                  myIcon: Icons.pin_drop_sharp,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                // create checkBox
                SizedBox(height: 20),

                // Checkbox(
                //   checkColor: Colors.white,
                //   activeColor: Colors.deepPurple,
                //   tristate: true,
                //   value: _checkBox,
                //   onChanged: (val) {
                //     setState(() {
                //       _checkBox = val;
                //     });
                //   },
                // ),
                CheckboxListTile(
                  value: _listTitleCheckBox,
                  title: Text("Top Product"),
                  onChanged: (val) {
                    setState(() {
                      _listTitleCheckBox = val;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                // Radio(value: null, groupValue: null, onChanged: null),

                // ListTile(
                //   title: Text("1"),
                //   leading: Radio(
                //     value: 1,
                //     groupValue: _selectedChoice,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedChoice = 1;
                //       });
                //     },
                //   ),
                // ),
                // ListTile(
                //   title: Text("2"),
                //   leading: Radio(
                //     value: 2,
                //     groupValue: _selectedChoice,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedChoice = 2;
                //       });
                //     },
                //   ),
                // ),
                // ListTile(
                //   title: Text("3"),
                //   leading: Radio(
                //     value: 3,
                //     groupValue: _selectedChoice,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedChoice = 3;
                //       });
                //     },
                //   ),
                // ),

                // RadioListTile(value: null, groupValue: null, onChanged: null),
                RadioListTile<ProductTypeEnum>(
                  title: Text(ProductTypeEnum.Downloadable.name),
                  value: ProductTypeEnum.Downloadable,
                  groupValue: _productTypeEnum,
                  onChanged: (val) {
                    setState(() {
                      _productTypeEnum = val;
                    });
                  },
                ),
                RadioListTile<ProductTypeEnum>(
                  title: Text(ProductTypeEnum.Deliverable.name),
                  value: ProductTypeEnum.Deliverable,
                  groupValue: _productTypeEnum,
                  onChanged: (val) {
                    setState(() {
                      _productTypeEnum = val;
                    });
                  },
                ),
                RadioListTile<ProductTypeEnum>(
                  title: Text(ProductTypeEnum.Onshop.name),
                  value: ProductTypeEnum.Onshop,
                  groupValue: _productTypeEnum,
                  onChanged: (val) {
                    setState(() {
                      _productTypeEnum = val;
                    });
                  },
                ),
                RadioListTile<ProductTypeEnum>(
                  title: Text(ProductTypeEnum.Reserver.name),
                  value: ProductTypeEnum.Reserver,
                  groupValue: _productTypeEnum,
                  onChanged: (val) {
                    setState(() {
                      _productTypeEnum = val;
                    });
                  },
                ),

                DropdownButton(
                  value: _selectedVal,
                  items: _productSizeList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedVal = val as String;
                    });
                  },
                ),

                DropdownButtonFormField(
                  initialValue: _selectedVal,
                  items: _productSizeList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedVal = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.deepPurple,
                  ),
                  dropdownColor: Colors.deepPurple.shade50,
                  decoration: InputDecoration(
                    labelText: "Select Product Size",
                    prefixIcon: Icon(
                      Icons.accessibility_new_rounded,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),
                myBtn(context),
                SizedBox(height: 40),
                Text(
                  "Product Name is : ${_productControllor.text}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Customer Name is : ${_productDecController.text}",
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
              return formshopping(
                productName: _productControllor.text,
                productDes: _productDecController.text,
              );
            },
          ),
        );
      },
      child: Text("SUBMIT"),
    );
  }
}

class MytextField extends StatelessWidget {
  const MytextField({
    super.key,
    required this.fieldName,
    required this.mycontroller,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController mycontroller;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
