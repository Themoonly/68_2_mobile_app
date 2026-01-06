import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonneyBox extends StatelessWidget {
  String title;
  double amount;
  double sizeconheight;
  Color colorset;
  double borderRadius;

  MonneyBox(this.title, this.amount, this.sizeconheight, this.colorset,this.borderRadius);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
      decoration: BoxDecoration(
        color: colorset,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: sizeconheight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          Expanded(
            child: Text(
              '${NumberFormat('#,###.###').format(amount)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
