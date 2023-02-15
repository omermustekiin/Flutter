import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../layout/screen_layout.dart';
import '../resources/authentication_methods.dart';
import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  AuthMethods authMethods = AuthMethods();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    adressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Amazon Logo
                Image.network(
                  amazonLogo,
                  height: screenSize.height * 0.18,
                ),

                SizedBox(
                    height: screenSize.width > 780 && screenSize.height > 850
                        ? 90
                        : 10),

                ///Register Form
                Container(
                  height: screenSize.height * 0.72,
                  width: screenSize.width * 0.9,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Kayıt ol text
                      const Text(
                        "Kayıt Ol",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 28),
                      ),

                      const Spacer(),

                      ///Ad soyad input
                      MyTextFieldWidget(
                        hintText: "Ad soyad giriniz...",
                        title: "Ad Soyad",
                        controller: nameController,
                        obscureText: false,
                      ),

                      const SizedBox(
                        height: 7,
                      ),

                      ///Email input
                      MyTextFieldWidget(
                        hintText: "Email giriniz...",
                        title: "Email",
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 7,
                      ),

                      ///Password input
                      MyTextFieldWidget(
                        hintText: "Şifre giriniz...",
                        title: "Şifre",
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 7,
                      ),

                      ///Adress input
                      MyTextFieldWidget(
                        hintText: "Adresinizi giriniz...",
                        title: "Adres",
                        controller: adressController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 7,
                      ),

                      ///Kayıt Ol button
                      Align(
                        alignment: Alignment.center,
                        child: MyCustomMainButton(
                            color: yellowColor,
                            isLoading: isLoading,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              String output = await authMethods.signUpUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  address: adressController.text);
                              setState(() {
                                isLoading = false;
                              });

                              if (output == "success") {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const ScreenLayout()));
                              } else {
                                Utils().showSnackBar(
                                    context: context, content: output);
                              }
                            },
                            child: const Text(
                              "Kayıt Ol",
                              style: TextStyle(
                                  letterSpacing: 0.6, color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),

                ///Zaten bir hesabım var button
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  },
                  child: const Text('Zaten bir hesabım var'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
