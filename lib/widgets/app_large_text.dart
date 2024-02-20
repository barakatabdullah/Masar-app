import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

class AppLargeText extends StatelessWidget {
  double size;
  String text;
  Color color;
  TextAlign textAlign;

  AppLargeText(
      {super.key,
      required this.text,
      this.color = AppColors.textColor1,
      this.size = 30,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
