import 'package:flutter/material.dart';

class formshopping extends StatelessWidget {
  const formshopping({
    super.key, 
    required this.productName, 
    required this.customerName, 
  });

  final String productName;
  final String customerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.account_balance_wallet_outlined),
                title: Text("productName is ${productName}"),
              ),
              ListTile(
                leading: Icon(Icons.account_balance_sharp),
                title: Text("customerName is ${customerName}"),
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
