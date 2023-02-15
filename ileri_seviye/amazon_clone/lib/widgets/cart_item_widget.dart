import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/custom_rounded_button.dart';
import 'package:amazon_clone/widgets/custom_square_button.dart';
import 'package:amazon_clone/widgets/product_info_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/user_details_provider.dart';
import '../screens/product_Screen.dart';
import '../utils/utils.dart';
import 'custom_main_button.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: const EdgeInsets.all(8),
      height: screenSize.height / 3,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          ///Product & Details
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(productModel: product),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///Product Image
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(product.url),
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  ///Product Info Widget
                  Align(
                    alignment: Alignment.topCenter,
                    child: ProductInfoWidget(
                      productName: product.productName,
                      cost: product.cost,
                      sellerName: product.sellerName,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Custom Square Buttons
          Expanded(
            flex: 1,
            child: Row(
              children: [
                ///Delete
                CustomSquareButton(
                  onPressed: () async {
                    await CloudFirestoreMethods()
                        .deleteProductFromCart(uid: product.uuid);
                  },
                  color: backgroundColor,
                  dimension: 26,
                  child: const Icon(Icons.remove),
                ),

                ///Number of Products
                CustomSquareButton(
                  onPressed: () {},
                  color: Colors.white,
                  dimension: 26,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("cart")
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("0");
                      } else {
                        return CustomSquareButton(
                          color: Colors.white,
                          onPressed: () {},
                          dimension: 22,
                          child: Text(
                            "${snapshot.data!.docs.length}",
                          ),
                        );
                      }
                    },
                  ),
                ),

                ///Add
                CustomSquareButton(
                  onPressed: () async {
                    await CloudFirestoreMethods().addProductToCart(
                        productModel: ProductModel(
                            url: product.url,
                            productName: product.productName,
                            cost: product.cost,
                            discount: product.discount,
                            uuid: Utils().getUid(),
                            sellerName: product.sellerName,
                            sellerUid: product.sellerUid,
                            rating: product.rating,
                            numberOfRating: product.numberOfRating));
                  },
                  color: backgroundColor,
                  dimension: 26,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          ///Delete & Save Buttons and "See more like this" text
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Delete & Save Buttons
                Row(
                  children: [
                    CustomRoundedButton(
                      onPressed: () async {
                        await CloudFirestoreMethods()
                            .deleteProductFromCart(uid: product.uuid);
                      },
                      text: "Sil",
                      btnNo: 0,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    CustomRoundedButton(
                        onPressed: () {}, text: "Kaydet", btnNo: 1),
                  ],
                ),

                ///See more like this
                const Padding(
                  padding: EdgeInsets.only(top: 6, left: 1),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Buna benzer daha fazla",
                      style: TextStyle(color: activeCyanColor, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
