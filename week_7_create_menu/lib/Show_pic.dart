import 'package:flutter/material.dart';

class ShowPic extends StatefulWidget {
  const ShowPic({super.key});

  @override
  State<ShowPic> createState() => _ShowPicState();
}

class _ShowPicState extends State<ShowPic> {
  String _selectImage = 'assets/images/image_1.jpg';

  void _changImage(String image) {
    setState(() {
      _selectImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('show Picture')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_selectImage, width: 300, height: 200),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [btShowPic1(), SizedBox(width: 10), btShowPic2()],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton btShowPic1() {
    return ElevatedButton(
      onPressed: () {
        _changImage('assets/images/image_1.jpg');
      },
      child: Text("show image 1"),
    );
  }

  ElevatedButton btShowPic2() {
    return ElevatedButton(
      onPressed: () {
        _changImage('assets/images/image_2.jpg');
      },
      child: Text("show image 2"),
    );
  }
}
