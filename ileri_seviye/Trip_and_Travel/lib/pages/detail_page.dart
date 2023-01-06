import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_and_travel/cubit/app_cubit_states.dart';
import 'package:trip_and_travel/cubit/app_cubits.dart';
import 'package:trip_and_travel/widgets_and_consts/button.dart';
import 'package:trip_and_travel/widgets_and_consts/colors.dart';
import 'package:trip_and_travel/widgets_and_consts/texts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedPeopleNumber = 0;
  Color? btnBackClr;
  bool? favBtnIsSelected, saveBtnIsSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                ///İmage
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" +
                                detail.places.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                ///navbar
                Positioned(
                  top: 20,
                  left: 10,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                        ),
                        iconSize: 26,
                        color: Colors.white,
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHomePage();
                        },
                      ),
                      const SizedBox(
                        width: 245,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                        ),
                        iconSize: 34,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                ///Content
                Positioned(
                  top: 300,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Headers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: MyLargeText(
                                text: detail.places.name,
                                color: Colors.grey[900]!,
                              ),
                            ),
                            MyLargeText(
                              text: "\$" + detail.places.price.toString(),
                              color: Colors.green[800]!,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///Location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey[600]!,
                            ),
                            const SizedBox(width: 5),
                            MySmallText(
                                text: detail.places.location,
                                color: Colors.grey[600]!),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///stars
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < detail.places.stars
                                      ? Colors.yellow[800]!
                                      : Colors.grey[400]!,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            MySmallText(
                              text: "(5.0)",
                              color: Colors.grey[700]!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///Peoples text and Numbers
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyLargeText(
                              text: "Kişiler",
                              color: Colors.grey[800]!,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            MySmallText(
                              text:
                                  "Geziye katılacağınız kişi sayısı: ${(selectedPeopleNumber + 1)} ",
                              color: Colors.grey[600]!,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Wrap(
                              spacing: 10,
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPeopleNumber = index;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: selectedPeopleNumber == index
                                            ? Colors.grey[800]!
                                            : Colors.grey[300]!),
                                    child: Center(
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            color: selectedPeopleNumber == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///Description
                        MyLargeText(
                          text: "Açıklama",
                          color: Colors.grey[800]!,
                          size: 20,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        MySmallText(
                          text: detail.places.description,
                          color: Colors.grey[600]!,
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///Fav Icon & Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///recordIcon
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: sekizNo,
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (saveBtnIsSelected == false) {
                                        saveBtnIsSelected = true;
                                      } else {
                                        saveBtnIsSelected = false;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                      saveBtnIsSelected == true
                                          ? Icons.bookmark_remove_rounded
                                          : Icons.bookmark_add_outlined,
                                      color: sekizNo),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),

                            ///favIcon
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (favBtnIsSelected == false) {
                                        favBtnIsSelected = true;
                                      } else {
                                        favBtnIsSelected = false;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    favBtnIsSelected == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),

                            ///registerButton
                            Container(
                              height: 45,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: sekizNo,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("Kayıt ol"),
                                    Icon(Icons.double_arrow_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
