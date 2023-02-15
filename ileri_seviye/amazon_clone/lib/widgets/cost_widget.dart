import 'dart:ui';

import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWidget({Key? key, required this.color, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "\$",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          cost.toInt().toString(),
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: color),
        ),
        Text(
          (cost - cost.toInt()).toStringAsFixed(2).replaceAll("0.", "."),
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontFeatures: const [
              FontFeature.superscripts(),
            ],
          ),
        ),
      ],
    );
  }
}
