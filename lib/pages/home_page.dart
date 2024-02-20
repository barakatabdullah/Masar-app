import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/widgets/app_drawer.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png': "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    TabController _tabController = TabController(length: 3, vsync: this);
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      LoadedState courses = state as LoadedState;
      return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: Container(
          height: double.maxFinite,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Expanded(child: Container()),

                     BlocBuilder<ThemeCubit, bool>(
                      builder: (BuildContext context, state) {
                        return IconButton(
                          onPressed: () {
                            BlocProvider.of<ThemeCubit>(context).toggleMode();
                          },
                          icon: state
                              ? Icon(Icons.dark_mode_outlined)
                              : Icon(Icons.light_mode_outlined),
                        );
                      },

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(
                  text: "Discover",
                  color: Theme.of(context).colorScheme.secondary,
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                height: double.maxFinite,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: courses.courses?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .course(id: courses.courses?[index]['id']);
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 15, top: 10),
                                width: double.maxFinite,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("img/" +
                                            courses.courses?[index]["image"]),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Positioned(
                                child: Container(
                              child: Text("Hello"),
                            ))
                          ],
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       AppLargeText(text: "Expolore more", size: 22,color: Theme.of(context).colorScheme.secondary,),
            //       AppText(
            //         text: "See all",
            //         color: Theme.of(context).colorScheme.primary,
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: double.maxFinite,
            //   height: 120,
            //   margin: const EdgeInsets.only(left: 20),
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 4,
            //       itemBuilder: (_, index) {
            //         return Container(
            //           margin: const EdgeInsets.only(right: 20),
            //           child: Column(
            //             children: [
            //               Container(
            //                 width: 80,
            //                 height: 80,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20),
            //                     color: Colors.white,
            //                     image: DecorationImage(
            //                         image: AssetImage(
            //                             "img/" + images.keys.elementAt(index)),
            //                         fit: BoxFit.cover)),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 child: AppText(
            //                   text: images.values.elementAt(index),
            //                   color: AppColors.textColor2,
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       }),
            // )
          ]),
        ),
      );
    });
  }
}


