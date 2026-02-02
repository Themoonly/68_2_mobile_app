import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'Show_pic.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget _currentPage = Page1();

  void _onPageSelect(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hamburger Menu Example"),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                title: Text('page 1'),
                onTap: () {
                  _onPageSelect(Page1());
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('page 2'),
                onTap: () {
                  _onPageSelect(Page2());
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('show Picture'),
                onTap: () {
                  _onPageSelect(ShowPic());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: _currentPage,
      ),
    );
  }
}
