import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

class AppText extends StatelessWidget {
  double size;
  String text;
  Color color;
  TextAlign textAlign;

  AppText(
      {super.key,
      required this.text,
      this.color = AppColors.textColor2,
      this.size = 16,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
