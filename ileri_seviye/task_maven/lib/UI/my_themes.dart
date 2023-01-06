import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color whiteClr = Colors.white;
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class MyThemes {
  static final lightMode = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
      backgroundColor: Colors.white);

  static final darkMode = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    backgroundColor: darkGreyClr,
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.grey[400] : Colors.grey),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700]),
  );
}
