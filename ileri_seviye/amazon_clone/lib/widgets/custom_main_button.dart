import 'package:flutter/material.dart';

import '../utils/utils.dart';

class MyCustomMainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;

  const MyCustomMainButton(
      {Key? key,
      required this.child,
      required this.color,
      this.isLoading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(screenSize.width * 0.5, 40),
      ),
      onPressed: onPressed,
      child: !isLoading
          ? child
          : Container(
              height: 18,
              width: 18,
              child: const AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
