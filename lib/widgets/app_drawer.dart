
import 'package:flutter/material.dart';
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
                      color: Colors.grey.withOpacity(0.5)),
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
          title: AppText(
            text: 'Bookmarks',
          ),
          onTap: () {},
        )
      ],
    );
  }
}
