import 'package:classwork_6/shopping.dart';
import 'package:flutter/material.dart';
import 'shopping.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test_1")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text("BODY WEEK 6 ", style: TextStyle(fontSize: 40)),
                  ElevateBTN(context),
                  SizedBox(height: 20),
                  outlineBTN(context),
                  SizedBox(height: 20),
                  TxtBTN(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton TxtBTN() =>
      TextButton(onPressed: () {}, child: Text("text button"));

  OutlinedButton outlineBTN(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return formshopping(productName: '', customerName: '',);
            },
          ),
        );
      },
      child: Text("Go To Shopping"),
      style: OutlinedButton.styleFrom(fixedSize: Size(250, 50)),
    );
  }

  ElevatedButton ElevateBTN(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("AlertDialog title"),
          content: const Text("AlertDialog description!"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'ok'),
              child: const Text('ok'),
            ),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Elevate bunton"), Icon(Icons.add_shopping_cart)],
      ),
      style: ElevatedButton.styleFrom(fixedSize: Size(250, 50), elevation: 12),
    );
  }
}
