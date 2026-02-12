import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: "Add list Example"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Data {
  late int id;
  late String name;
  late DateTime t;

  Data(this.id, this.name, this.t);
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = 'N/A';
  List<Data> mylist = <Data>[];
  int img = 0;
  var list = ['one', 'two', 'three', 'four'];

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = value ?? 0;
                    });
                  },
                ),
                const Text("instagram"),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/instragram.png'),
                ),
                Radio(
                  value: 2,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = value ?? 0;
                    });
                  },
                ),
                const Text("Rocket"),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/rocket.png'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'กรอกชื่อรายการ',
                  hintText: 'พิมพ์ชื่อที่นี้...',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (nameController.text.isNotEmpty) {
                    txt = "add item success";
                    mylist.add(Data(img, nameController.text, DateTime.now()));
                    nameController.clear();
                  }
                });
              },
              child: const Text('add item'),
            ),
            Text(txt, textScaler: const TextScaler.linear(2.0)),
            SizedBox(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            mylist[index].id == 1
                                ? 'assets/images/instagram.png'
                                : 'assets/images/rocket.png',
                          ),
                        ),
                        title: Text(
                          mylist[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(mylist[index].t.toString()),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_rounded, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              txt = '${mylist[index].name} is removed';
                              mylist.removeAt(index);
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            txt = '${mylist[index].name}  is removed';
                            mylist.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
