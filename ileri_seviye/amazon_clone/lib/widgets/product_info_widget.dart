import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProductInfoWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInfoWidget(
      {Key? key,
      required this.productName,
      required this.cost,
      required this.sellerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///Product Name
          Text(
            productName,
            maxLines: 2,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 0.5,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 5,
          ),

          ///Cost
          Align(
            alignment: Alignment.centerLeft,
            child: CostWidget(color: Colors.black, cost: cost),
          ),
          const SizedBox(
            height: 5,
          ),

          ///Seller Name
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Satıcı: ",
                    style: TextStyle(color: Colors.grey[900], fontSize: 13),
                  ),
                  TextSpan(
                    text: sellerName,
                    style:
                        const TextStyle(color: activeCyanColor, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
