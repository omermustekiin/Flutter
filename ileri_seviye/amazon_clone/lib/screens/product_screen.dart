import 'package:amazon_clone/models/comment_model.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/comment_dialog.dart';
import 'package:amazon_clone/widgets/comment_widget.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_details_provider.dart';
import '../widgets/loading_widget.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  SizedBox littleSpace = const SizedBox(
    height: 4,
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: true, hasBackButton: true),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: kAppBarHeight / 2,
                    ),

                    ///Seller Name, Product Name, Rating Stars & Total Comment Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productModel.sellerName,
                                style: TextStyle(color: Colors.blue[800]),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(widget.productModel.productName),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingStarWidget(
                                rating: widget.productModel.rating),
                            RichText(
                              text: TextSpan(
                                text: "yorumlar (2)",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    littleSpace,

                    ///Product Image & Arrows
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: screenSize.height / 4,
                      ),
                      width: screenSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 22,
                          ),
                          Container(
                              width: screenSize.width * 0.70,
                              child: Image.network(widget.productModel.url)),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                    littleSpace,

                    ///Price
                    CostWidget(
                        color: Colors.black, cost: widget.productModel.cost),
                    littleSpace,

                    ///Satın Al Butonu
                    MyCustomMainButton(
                      onPressed: () async {
                        await CloudFirestoreMethods().addProductToOrders(
                            model: widget.productModel,
                            userDetails: Provider.of<UserDetailsProvider>(
                                    context,
                                    listen: false)
                                .userDetails);
                        Utils().showSnackBar(
                            context: context, content: "Tamamlandı");
                      },
                      color: Colors.orange,
                      isLoading: false,
                      child: const Text(
                        "Satın al",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    ///Sepete Ekle Butonu
                    MyCustomMainButton(
                        color: Colors.yellow,
                        isLoading: false,
                        onPressed: () async {
                          await CloudFirestoreMethods().addProductToCart(
                              productModel: widget.productModel);
                          Utils().showSnackBar(
                              context: context, content: "Sepete eklendi");
                        },
                        child: const Text(
                          "Sepete ekle",
                          style: TextStyle(color: Colors.black),
                        )),

                    ///Yorum Ekle Butonu
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => CommentDialog(
                              productUid: widget.productModel.uuid,
                            ),
                          );
                        },
                        child: Text(
                          "Yorum Ekle",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 13),
                        )),

                    ///Comments
                    SizedBox(
                      height: screenSize.height,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .doc(widget.productModel.uuid)
                            .collection("comments")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return LoadingWidget();
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                CommentModel model =
                                    CommentModel.getModelFromJson(
                                        json:
                                            snapshot.data!.docs[index].data());
                                return CommentWidget(
                                  comment: model,
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
