import 'package:flutter/material.dart';
import 'package:travel_app/colors/colors.dart';
import 'package:travel_app/widgets/app_text%20copy.dart';

class ResponsiveButton extends StatelessWidget {
  final double width;
  final bool isResponsive;
  final String? text;

  ResponsiveButton({
    this.width = 100,
    this.isResponsive = false,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: AppText(
                      color: Colors.white,
                      text: isResponsive ? text! : "",
                    ),
                  )
                : Container(),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}
