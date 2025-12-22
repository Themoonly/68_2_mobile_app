import 'foodmenu.dart';
import 'package:flutter/material.dart';

void main() {
  // ทำงานโดยเรียกคลาส Myapp
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
  int countmenu = 0;
  double totalprice = 0;

// create listview
  List<foodmenu> menu = [
    foodmenu("กระเพราหมูสับ", "60", "assets/images/m1.jpg", "ประเภท ผัด"),
    foodmenu("ผัดไทยกุ้งสุก", "65", "assets/images/m2.jpg", "ประเภท ผัด"),
    foodmenu("ซูชิจากเจแปน", "100", "assets/images/m3.jpg", "ประเภท ของสด"),
    foodmenu("บาบีคิวเนื้อ", "50", "assets/images/m4.jpg", "ประเภท ย่าง"),
    foodmenu("ซาลาเปา", "20", "assets/images/m5.jpg", "ประเภท นึ่ง"),
    foodmenu("กุ้งเผาตัวส้ม", "250", "assets/images/m6.jpg", "ประเภท เผา"),
    foodmenu("ต้มมะระ", "55", "assets/images/m7.jpg", "ประเภท ต้ม"),
    foodmenu("ปลาทอด", "120", "assets/images/m8.jpg", "ประเภท ทอด"),
    foodmenu("แหนมเนือง", "150", "assets/images/m9.jpg", "ประเภท นึ่ง"),
    foodmenu("แฮมเบอเกอร์", "45", "assets/images/m10.jpg", "ประเภท ทอด"),
    foodmenu("ผัดซีอิ้ว", "46", "assets/images/m11.jpg", "ประเภท ผัด"),
    foodmenu("สุกกี้", "47", "assets/images/m12.jpg", "ประเภท ต้ม"),
    foodmenu("มักกะโรนี", "48", "assets/images/m13.jpg", "ประเภท ผัด"),
    foodmenu("กระเพราเนื้อ", "49", "assets/images/m14.jpg", "ประเภท ผัด"),
    foodmenu("ผัดขี้เมา", "51", "assets/images/m15.jpg", "ประเภท ผัด"),
    foodmenu("ไก่กระเทียม", "32", "assets/images/m16.jpg", "ประเภท ทอด"),
    foodmenu("ข้าวผัดหมู", "30", "assets/images/m17.jpg", "ประเภท ผัด"),
    foodmenu("ผัดผักทะเล", "159", "assets/images/m18.jpg", "ประเภท ผัด"),
    foodmenu("ราดหน้า", "59", "assets/images/m19.jpg", "ประเภท ต้ม"),
    foodmenu("ข้าวไข่เจียว", "25", "assets/images/m20.jpg", "ประเภท ทอด"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// print title top bar,
        title: Text(
          "เลือกเมนูอาหาร      ทั้งหมด : $countmenu เมนู      ราคาทั้งหมด : $totalprice",
        ),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          foodmenu food = menu[index];
          return ListTile(
            leading: Image.asset(food.images, width: 150),
            title: Text(
              "${index + 1}" "." + food.foodname,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              "${food.foodtype} menu ${food.foodname} price ${food.foodprice} baht ",
            ),
            onTap: () {
              setState(() {
                // parse แปลง type ตัวแปร str to String
                countmenu = countmenu += 1;
                totalprice += double.parse(food.foodprice);
              });
              // print("your menu is " + food.foodname);
              AlertDialog alert = AlertDialog(
                title:Center(child: Text("${food.foodname} : ${food.foodtype}")),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(" เมนูล่าสุด : ${food.foodname}" ,style: TextStyle(fontSize: 20)),
                    Text(" รายการทั้งหมด : $countmenu" ,style: TextStyle(fontSize: 20)),
                    Text(" ราคาสุทธิ : $totalprice" ,style: TextStyle(fontSize: 20)),
                  ],
                ), 
                
                
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            totalprice = 0;
            countmenu = 0;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
