import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/app_input.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Image.asset("img/login_screen_image.png"),
                  ),
                  AppLargeText(
                      text: "Login",
                      color: Theme.of(context).colorScheme.tertiary),
                  AppText(
                    text: "Enter your account here",
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 4),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Name",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  AppInput(onChange: (value) {
                    username = value;
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 4),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  AppInput(
                    obscureText: true,
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<AppCubits>(context)
                          .onlogin(username: username, password: password);
                    },
                    child: AppButton(
                      width: double.maxFinite,
                      child: AppText(
                        text: "Login",
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
