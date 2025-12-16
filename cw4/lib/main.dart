import 'food.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<foodmenu> menu = [
    foodmenu("กุ้งเผา 1", "600"),
    foodmenu("กุ้งเผา 2", "500"),
    foodmenu("กุ้งเผา 3", "400"),
    foodmenu("กุ้งเผา 4", "300"),
    foodmenu("กุ้งเผา 5", "200"),
    foodmenu("กุ้งเผา 6", "100"),
  ];

  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("CW4"),
      ),
      // body: Center(child: ListView(children: getdata(40))),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          foodmenu food = menu[index];

          return ListTile(
            title: Text("เมนูที่ ${index + 1}"),
            subtitle: Text(
              food.foodname + " price " + food.foodprice + " baht ",
            ),
          );
        },
      ),
    );
  }

  // List<Widget> getdata(int count) {
  //   List<Widget> data = [];
  //   for (var i = 1; i <= count; i++) {
  //     var menu = ListTile(
  //       title: Text('เมนูที่ $i '),
  //       subtitle: Text("ราคาของเมนูที่ $i"),
  //     );

  //     data.add(menu);
  //   }
  //   return data;
  // }
}
