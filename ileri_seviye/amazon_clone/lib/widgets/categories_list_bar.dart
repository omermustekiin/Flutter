import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

import '../screens/results_screen.dart';

class CategoriesListBar extends StatelessWidget {
  const CategoriesListBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(
                      query: categoriesList[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          categoryLogos[index],
                        ),
                      ),
                      Spacer(),
                      Text(categoriesList[index]),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
