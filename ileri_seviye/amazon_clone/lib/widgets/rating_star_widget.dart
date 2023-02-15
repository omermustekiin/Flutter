import 'package:flutter/material.dart';

class RatingStarWidget extends StatelessWidget {
  final int rating;
  const RatingStarWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 5; i++) {
      children.add(
        i < rating
            ? const Icon(
                Icons.star,
                color: Colors.orange,
                size: 18,
              )
            : const Icon(
                Icons.star_outline,
                color: Colors.orange,
                size: 18,
              ),
      );
    }

    return Row(
      children: children,
    );
  }
}
