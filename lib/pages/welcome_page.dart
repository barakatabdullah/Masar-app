import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  List welcoming = [
    {
      "title": "Unleash your potential!",
      "description":
          "Explore customized learning roadmaps designed to guide you toward your tech dreams, right in your pocket."
    },
    {
      "title": "Level up your skills with confidence",
      "description":
          "Curated paths, expert insights, and interactive challenges pave the way to your tech mastery."
    },
    {
      "title": "Wander no more!",
      "description":
          "start conquering. This is your personalized journey to becoming a tech powerhouse. Dive in and unlock your future! "
    },
  ];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      viewportFraction: 1,
      initialPage: 0,
    );

    Future<void> setInitiated() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("Initiated", true);
    }

    return Scaffold(
        body: PageView.builder(
            controller: controller,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/" + images[index]),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 460),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: welcoming[index]["title"],
                        size: 25,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text: welcoming[index]["description"],
                          color: AppColors.textColor2,
                          size: 14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (index == 2) {
                            setInitiated();
                            BlocProvider.of<AppCubits>(context).auth();
                          } else {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: AppButton(
                          width: 140,
                          child: AppText(
                            text: index == 2 ? "Start" : "Next",
                            color: AppColors.mainTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
