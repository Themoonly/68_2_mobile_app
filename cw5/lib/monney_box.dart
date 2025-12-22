import 'package:flutter/material.dart';

class MonneyBox extends StatelessWidget {
  String title;
  double amount;
  double sizeconheight;
  Color colorset;

  MonneyBox(this.title, this.amount, this.sizeconheight, this.colorset);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: colorset,
        borderRadius: BorderRadius.circular(20),
      ),
      height: sizeconheight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
