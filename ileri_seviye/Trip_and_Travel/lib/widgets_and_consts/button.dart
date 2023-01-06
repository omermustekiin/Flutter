import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_and_travel/widgets_and_consts/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: sekizNo,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.double_arrow_outlined,
            size: 40,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
