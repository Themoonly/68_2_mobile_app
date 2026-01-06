import 'package:flutter/material.dart';

// class formshopping extends StatelessWidget {
//   const formshopping({super.key});

class formshopping extends StatelessWidget {
  const formshopping({super.key, required this.productName});
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Screen")),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(productName),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
