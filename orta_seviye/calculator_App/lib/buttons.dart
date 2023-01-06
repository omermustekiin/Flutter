import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final dynamic color;
  final dynamic textColor;
  final String buttonText;
  final buttonTapped;

  MyButton(
      {this.color,
      required this.buttonText,
      this.textColor,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
            )),
      ),
    );
  }
}
