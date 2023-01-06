import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_and_travel/cubit/app_cubits.dart';
import 'package:trip_and_travel/widgets_and_consts/colors.dart';

import '../widgets_and_consts/button.dart';
import '../widgets_and_consts/texts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.jpg",
    "welcome-two.jpg",
    "welcome-three.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, indexPageView) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/" + images[indexPageView]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyLargeText(
                          text: "Özgürce",
                          color: besNo,
                        ),
                        MyMiddleText(
                          text: "Keşfet",
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 230,
                          child: MySmallText(
                            text:
                                "Yerlere, kişilere ve zamana bağlı olmadan her yeri özgürce keşfet.",
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: ResponsiveButton(
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: indexPageView == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: indexPageView == indexDots
                                ? sekizNo
                                : birNo.withOpacity(0.8),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
