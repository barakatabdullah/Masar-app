import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class RecycleBinPage extends StatelessWidget {
  const RecycleBinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AppText(
          text: 'bookmarks',
        ),
      ),
    );
  }
}
