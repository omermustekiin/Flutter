import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home_page.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomePage(),
        title: const Text(
          'Get It Done!',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        image: Image.asset('assets/splash_image.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 80.0,
        loaderColor: Colors.blue);
  }
}
