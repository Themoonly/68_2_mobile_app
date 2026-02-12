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
      home: MyHomePage(title: "List Example"),
    );
  }
}

class Data {
  late int id;
  late String name;
  late DateTime t;

  Data(this.id, this.name, this.t);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = 'N/A';
  List<Data> mylist = <Data>[];
  int imgId = 1;

  final TextEditingController nameController = TextEditingController();

  String getImagePath(int id) {
    switch (id) {
      case 1:
        return 'assets/images/instragram.png';
      case 2:
        return 'assets/images/line.png';
      case 3:
        return 'assets/images/avengers.png';
      case 4:
        return 'assets/images/marvel.jpg';
      case 5:
        return 'assets/images/rocket.png';
      default:
        return 'assets/images/people.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++) ...[
                  Radio(
                    value: i,
                    groupValue: imgId,
                    onChanged: (int? value) => setState(() => imgId = value!),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(getImagePath(i)),
                  ),
                ],
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title Text',
                hintText: 'กรอกข้อความที่นี่',
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                if (nameController.text.isNotEmpty) {
                  txt = "Add item Success";
                  mylist.add(Data(imgId, nameController.text, DateTime.now()));
                  nameController.clear();
                }
              });
            },
            child: const Text('Add Item'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              txt,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  height: 80,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          getImagePath(mylist[index].id),
                        ),
                      ),
                      title: Text(
                        mylist[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        mylist[index].t.toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white70),
                        onPressed: () {
                          setState(() {
                            txt = "${mylist[index].name} is remove";
                            mylist.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
