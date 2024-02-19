import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/misc/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TTextTheme.lightTextTheme,
    colorScheme: ColorScheme(
      primary: AppColors.mainColor,
      brightness: Brightness.light,
      onPrimary: AppColors.mainTextColor,
      background: AppColors.backgroundColor,
      secondary: AppColors.bigTextColor,
      onSecondary: AppColors.mainTextColor,
      onError: Colors.red,
      error: Colors.orange,
      onBackground: AppColors.textGray,
      surface:  AppColors.backgroundColor,
      onSurface: AppColors.textColor2,
      tertiary: AppColors.textColor1,
      shadow: AppColors.textGray

    ),

  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: TTextTheme.darkTextTheme,
  scaffoldBackgroundColor: AppDarkColors.backgroundColor,

  colorScheme: ColorScheme(
  primary: AppDarkColors.mainColor,
  brightness: Brightness.light,
  onPrimary: AppDarkColors.mainTextColor,
  background: AppDarkColors.backgroundColor,
  secondary: AppDarkColors.bigTextColor,
  onSecondary: AppDarkColors.mainTextColor,
  onError: Colors.red,
  error: Colors.orange,
  onBackground: AppDarkColors.textGray,
  surface:  AppDarkColors.backgroundColor,
  onSurface: AppDarkColors.textColor2,
  tertiary: AppDarkColors.textColor1,
  shadow: AppDarkColors.textGray
  )
  );
}
