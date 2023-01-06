import 'package:flutter/material.dart';
import 'dart:ui';

final Color birNo = HexColor("CAF0F8");
final Color ikiNo = HexColor("ADE8F4");
final Color ucNo = HexColor("90E0EF");
final Color dortNo = HexColor("48CAE4");
final Color besNo = HexColor("00B4D8");
final Color altiNo = HexColor("0096C7");
final Color yediNo = HexColor("0077B6");
final Color sekizNo = HexColor("023E8A");
final Color dokuzNo = HexColor("03045E");

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
