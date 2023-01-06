import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotifiedPage extends StatelessWidget {
  final String? label;
  const NotifiedPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.grey[600] : Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
          ),
          title: Text(
            this.label.toString().split("|")[0],
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.grey),
          ),
        ),
        body: Center(
          child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Get.isDarkMode ? Colors.grey[300] : Colors.grey[600],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    this.label.toString().split("|")[1],
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
        ));
  }
}
