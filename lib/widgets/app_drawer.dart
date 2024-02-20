
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("img/my_photo.jpg"),
                          fit: BoxFit.cover)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(
                      text: 'Abdullah Barakat',
                      color: Theme.of(context).colorScheme.secondary,
                      size: 16,
                    ),
                    AppText(
                      text: 'Student',
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ],
            )),
        ListTile(
          title:Row(
            children: [
              Icon(Icons.bookmark_outline),
              SizedBox(
                width: 3,
              ),
              AppText(
                text: 'Bookmarks',
              ),
            ],
          ),
          onTap: () {
            BlocProvider.of<AppCubits>(context).bookmark();
          },
        ),
        ListTile(

          title: Row(
            children: [
              Icon(Icons.delete_outline),
              SizedBox(
                width: 3,
              ),
              AppText(
                text: 'Recycle Bin',
              ),
            ],
          ),

          onTap: () {
            BlocProvider.of<AppCubits>(context).recycle();
          },
        ),
        Expanded(child: Container()),
        ListTile(

          title: Row(
            children: [
              Icon(Icons.logout_outlined),
              SizedBox(
                width: 3,
              ),
              AppText(
                text: 'Log Out',
              ),
            ],
          ),

          onTap: () {
            BlocProvider.of<AppCubits>(context).logout();
          },
        ),
      ],
    );
  }
}
