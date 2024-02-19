import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

class AppButton extends StatelessWidget {
  double? width;
  Widget? child;
  AppButton({super.key, this.width, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Center(child: child),
    );
  }
}
