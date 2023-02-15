import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/product_Screen.dart';
import '../utils/utils.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productModel: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ///Image
            SizedBox(
              width: screenSize.width / 6,
              child: Image.network(
                product.url,
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            ///Name
            Text(
              product.productName,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 3,
            ),

            ///Stars
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingStarWidget(rating: product.rating),
                const Spacer(),
                Text(
                  product.numberOfRating.toString(),
                  style: const TextStyle(color: activeCyanColor),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),

            ///Price
            CostWidget(color: Colors.black, cost: product.cost),
          ],
        ),
      ),
    );
  }
}
