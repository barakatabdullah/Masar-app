import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
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
    TabController _tabController = TabController(length: 3, vsync: this);
    return BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
      LoadedState courses = state as LoadedState;
      return Scaffold(
        body: Container(
          height: double.maxFinite,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
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
                child: AppLargeText(text: "Discover",color: Theme.of(context).colorScheme.secondary,)),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                height: double.maxFinite,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: courses.courses?.length,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).course();
                        },
                        child: Stack(
                          children: [
                            Positioned(child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: double.maxFinite,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("img/"+courses.courses?[index]["image"]),
                                      fit: BoxFit.cover)),
                            ),),
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

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2 - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
