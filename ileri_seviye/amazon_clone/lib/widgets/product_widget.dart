import 'package:amazon_clone/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productModel: productModel),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(productModel.url),
          ),
        ),
      ),
    );
  }
}
