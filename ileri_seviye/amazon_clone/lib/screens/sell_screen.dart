import 'dart:typed_data';

import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/loading_widget.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 4;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<int> keysForDiscount = [0, 25, 50, 75];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: !isLoading
          ? SingleChildScrollView(
              child: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///Upload Image
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            image == null
                                ? GestureDetector(
                                    onTap: () async {
                                      Uint8List? temp =
                                          await Utils().pickImage();
                                      if (temp != null) {
                                        setState(() {
                                          image = temp;
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      height: screenSize.height / 8.5,
                                      child: Image.network(
                                          "https://st2.depositphotos.com/3904951/8925/v/600/depositphotos_89250312-stock-illustration-photo-picture-web-icon-in.jpg"),
                                    ),
                                  )
                                : Image.memory(
                                    height: screenSize.height / 8.25,
                                    fit: BoxFit.cover,
                                    image!,
                                  ),
                            IconButton(
                              padding: const EdgeInsets.only(left: 40, top: 18),
                              onPressed: () async {
                                Uint8List? temp = await Utils().pickImage();
                                if (temp != null) {
                                  setState(() {
                                    image = temp;
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 26,
                              ),
                            ),
                          ],
                        ),

                        ///Form Field
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: screenSize.height * 0.6,
                          width: screenSize.width * 0.83,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///Product Name
                              MyTextFieldWidget(
                                  title: "İsim",
                                  controller: nameController,
                                  obscureText: false,
                                  hintText: "Ürünün adını giriniz"),

                              ///Price
                              MyTextFieldWidget(
                                  title: "Fiyat",
                                  controller: costController,
                                  obscureText: false,
                                  hintText: "Ürünün fiyatını giriniz"),

                              ///Discount
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "İndirim",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: (screenSize.width * 0.83) / 2.5,
                                        child: RadioListTile(
                                          activeColor: yellowColor,
                                          title: const Text("Yok"),
                                          value: 1,
                                          groupValue: selected,
                                          onChanged: (int? i) {
                                            setState(() {
                                              selected = i!;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: (screenSize.width * 0.83) / 2.5,
                                        child: RadioListTile(
                                          activeColor: yellowColor,
                                          title: const Text("25%"),
                                          value: 2,
                                          groupValue: selected,
                                          onChanged: (int? i) {
                                            setState(() {
                                              selected = i!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: (screenSize.width * 0.83) / 2.5,
                                        child: RadioListTile(
                                          activeColor: yellowColor,
                                          title: const Text("50%"),
                                          value: 3,
                                          groupValue: selected,
                                          onChanged: (int? i) {
                                            setState(() {
                                              selected = i!;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: (screenSize.width * 0.83) / 2.5,
                                        child: RadioListTile(
                                          activeColor: yellowColor,
                                          title: const Text("75%"),
                                          value: 4,
                                          groupValue: selected,
                                          onChanged: (int? i) {
                                            setState(() {
                                              selected = i!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        ///Buttons
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyCustomMainButton(
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                String output = await CloudFirestoreMethods()
                                    .uploadProductToDatabase(
                                        image: image,
                                        productName: nameController.text,
                                        rawCost: costController.text,
                                        discount: keysForDiscount[selected - 1],
                                        sellerName:
                                            Provider.of<UserDetailsProvider>(
                                                    context,
                                                    listen: false)
                                                .userDetails
                                                .name,
                                        sellerUid: FirebaseAuth
                                            .instance.currentUser!.uid);
                                if (output == "success") {
                                  Utils().showSnackBar(
                                      context: context,
                                      content: "Başarıyla eklendi");
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              },
                              child: const Text(
                                "Sat",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            MyCustomMainButton(
                              color: Colors.grey[300]!,
                              isLoading: isLoading,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Geri Dön",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const LoadingWidget(),
    ));
  }
}
