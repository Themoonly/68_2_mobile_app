import 'package:flutter/material.dart';
// import 'food.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
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

  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text('hw4', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("เมนูที่ ${index + 1}"));
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                count += 1;
              });
            },
            heroTag: 'increase',
            child: Icon(Icons.add),
          ),

          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (count > 0) count -= 1;
              });
            },
            heroTag: 'increase',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
