import 'package:book/core/utils/styles.dart';
import 'package:flutter/material.dart';

class rating extends StatelessWidget {
  const rating({super.key, required this.rate, required this.count});
  final num rate;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "$rate",
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "$count",
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
