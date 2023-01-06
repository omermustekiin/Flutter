import 'package:flutter/material.dart';

import '../consts & utils/colors.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
      width: 16,
      child: Center(
        child: CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 2.5,
        ),
      ),
    );
  }
}
