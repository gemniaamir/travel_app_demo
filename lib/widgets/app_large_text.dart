import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  Color color;
  final String text;
  double size;

  AppLargeText({
    this.color = Colors.black,
    this.size = 30,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
