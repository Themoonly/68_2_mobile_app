import 'foodmenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    foodmenu("กระเพราหมูสับ", "60", "assets/images/m1.jpg"),
    foodmenu("ผัดไทยกุ้งสุก", "65", "assets/images/m2.jpg"),
    foodmenu("ซูชิจากเจแปน", "100", "assets/images/m3.jpg"),
    foodmenu("บาบีคิมเนื้อ", "50", "assets/images/m4.jpg"),
    foodmenu("ซาลาเปา", "20", "assets/images/m5.jpg"),
    foodmenu("กุ้งเผาตัวส้ม", "250", "assets/images/m6.jpg"),
    foodmenu("ต้มมะระ", "55", "assets/images/m7.jpg"),
    foodmenu("ปลาทอด", "120", "assets/images/m8.jpg"),
    foodmenu("แหนมเนือง", "150", "assets/images/m9.jpg"),
    foodmenu("แฮมเบอเกอร์", "45", "assets/images/m10.jpg"),
  ];

  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("เลือกเมนูอาหาร"),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          foodmenu food = menu[index];

          return ListTile(
            leading: Image.asset(food.images, width: 150),
            title: Text(
              "${index + 1}" + "." + food.foodname,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text("${food.foodname} price ${food.foodprice} baht "),
            onTap: () {
              // print("your menu is " + food.foodname);
              AlertDialog alert = AlertDialog(
                title: Text("your menu is " + food.foodname),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          );
        },
      ),
    );
  }
}
