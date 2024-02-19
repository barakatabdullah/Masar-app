import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';

class AppInput extends StatelessWidget {
  final bool obscureText;
  void Function(String) onChange;
  AppInput({super.key, this.obscureText = false, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(

      builder: (BuildContext context, bool state) {
        return Container(
          padding: const EdgeInsets.only(left: 6, right: 6),
          decoration: BoxDecoration(
              color:state? null:Theme.of(context).colorScheme.shadow,
              border: state ? Border.all(color: Theme.of(context).colorScheme.onSurface): null,
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
              onChanged: onChange,
              obscureText: obscureText,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(border: InputBorder.none)),
        );
      },

    );
  }
}
