import 'package:beklenen_yasam_suresi/Constants.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String cinsiyetMetni;

  GenderWidget({this.icon, this.cinsiyetMetni});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyetMetni,
          style: kMetinStili,
        )
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget child;
  final Function onPress;

  MyContainer({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
      ),
    );
  }
}
