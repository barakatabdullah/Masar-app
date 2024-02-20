import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      CourseState lessons = state as CourseState;
      print(lessons);
      return Scaffold(
          body: Container(
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).home();
                    },
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(
                  text: "Courses",
                  color: Theme.of(context).colorScheme.secondary,
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                height: double.maxFinite,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: 1,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context)
                            .lesson(id: lessons.lessons?[0]['id']);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 6, bottom: 6),
                        color: Theme.of(context).colorScheme.shadow,
                        child: AppText(
                          text: lessons.lessons?[0]['title'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }
}
