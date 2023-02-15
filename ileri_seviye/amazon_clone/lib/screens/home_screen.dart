import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/categories_list_bar.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/loading_widget.dart';

import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount75;
  List<Widget>? discount50;
  List<Widget>? discount25;
  List<Widget>? discount0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    List<Widget> temp75 =
        await CloudFirestoreMethods().getProductsFromDiscount(75);
    List<Widget> temp50 =
        await CloudFirestoreMethods().getProductsFromDiscount(50);
    List<Widget> temp25 =
        await CloudFirestoreMethods().getProductsFromDiscount(25);
    List<Widget> temp0 =
        await CloudFirestoreMethods().getProductsFromDiscount(0);

    setState(() {
      discount75 = temp75;
      discount50 = temp50;
      discount25 = temp25;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: discount75 != null &&
              discount50 != null &&
              discount25 != null &&
              discount0 != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: kAppBarHeight / 2,
                      ),
                      CategoriesListBar(),
                      MyBannerAdWidget(),
                      ProductsShowcaseListView(
                          title: "75% İndirim", children: discount75!),
                      ProductsShowcaseListView(
                          title: "50% İndirim", children: discount50!),
                      ProductsShowcaseListView(
                          title: "25% İndirim", children: discount25!),
                      ProductsShowcaseListView(
                          title: "Keşfet", children: discount0!),
                    ],
                  ),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
