import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_and_travel/pages/home_page.dart';
import 'package:trip_and_travel/pages/navpages/bar_item.dart';
import 'package:trip_and_travel/pages/navpages/my_page.dart';
import 'package:trip_and_travel/pages/navpages/search_page.dart';
import 'package:trip_and_travel/widgets_and_consts/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          selectedItemColor: sekizNo,
          unselectedItemColor: sekizNo.withOpacity(0.3),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.apps,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Bar',
              icon: Icon(
                Icons.bar_chart_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              label: 'My',
              icon: Icon(
                Icons.person,
              ),
            ),
          ]),
    );
  }
}
