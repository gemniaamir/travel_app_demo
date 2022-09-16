// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app/colors/colors.dart';
import 'package:travel_app/widgets/app_text%20copy.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.size,
    required this.borderColor,
    required this.backgroundColor,
    this.text,
    required this.textColor,
    this.icon,
    required this.isIcon,
  }) : super(key: key);

  final double size;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final bool isIcon;
  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
          color: backgroundColor,
        ),
        child: Center(
          child: !isIcon
              ? AppText(
                  text: text!,
                  color: textColor,
                )
              : Icon(icon, color: borderColor),
        ));
  }
}
