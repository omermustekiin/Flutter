import 'dart:async';

import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class MyBannerAdWidget extends StatefulWidget {
  const MyBannerAdWidget({Key? key}) : super(key: key);

  @override
  State<MyBannerAdWidget> createState() => _MyBannerAdWidgetState();
}

class _MyBannerAdWidgetState extends State<MyBannerAdWidget> {
  int currentLargeAd = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 8), (timer) {
      if (currentLargeAd == (largeAds.length - 1)) {
        currentLargeAd = -1;
      }
      setState(() {
        currentLargeAd++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        ///LargeAds
        SizedBox(
          height: 145,
          child: GestureDetector(
            onTap: () {},
            onHorizontalDragEnd: (_) {
              if (currentLargeAd == (largeAds.length - 1)) {
                currentLargeAd = -1;
              }
              setState(() {
                currentLargeAd++;
              });
            },
            child: Stack(
              children: [
                Image.network(
                  largeAds[currentLargeAd],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: screenSize.width,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            backgroundColor.withOpacity(0.65),
                            backgroundColor.withOpacity(0)
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        ///SmallAds
        Container(
          color: backgroundColor,
          width: screenSize.width,
          height: 95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getSmallAds(0),
              getSmallAds(1),
              getSmallAds(2),
              getSmallAds(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSmallAds(int index) {
    return Container(
      height: 100,
      width: 83,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1),
          ]),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 60, height: 60, child: Image.network(smallAds[index])),
            const SizedBox(
              height: 6,
            ),
            Text(
              adItemNames[index],
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
