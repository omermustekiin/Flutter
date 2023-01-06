import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, required this.padding}) : super(key: key);

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset(Constants.kIconSearch),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.4),
                decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.5),
                        fontSize: 15,
                        letterSpacing: -0.4)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset(Constants.kIconMic),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
