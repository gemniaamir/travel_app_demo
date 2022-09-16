import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  Color color;
  final String text;
  double size;

  AppText({
    this.color = Colors.black54,
    this.size = 16,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
