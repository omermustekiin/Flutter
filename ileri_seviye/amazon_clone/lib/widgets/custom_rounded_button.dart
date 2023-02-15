import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final int btnNo;

  const CustomRoundedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.btnNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: btnNo == 0 ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(color: btnNo == 0 ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
