import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const MyLargeText(
      {Key? key, required this.text, this.color = Colors.white, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class MyMiddleText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const MyMiddleText(
      {Key? key,
      required this.text,
      this.color = Colors.white60,
      this.size = 26})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}

class MySmallText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const MySmallText(
      {Key? key,
      required this.text,
      this.color = Colors.white60,
      this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
