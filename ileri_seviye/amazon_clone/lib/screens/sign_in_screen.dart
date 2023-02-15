import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../layout/screen_layout.dart';
import '../utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthMethods authMethods = AuthMethods();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Amazon Logo
                Image.network(
                  amazonLogo,
                  height: screenSize.height * 0.18,
                ),

                SizedBox(
                    height: screenSize.width > 780 && screenSize.height > 850
                        ? 100
                        : 20),

                ///Login Form
                Container(
                  height: screenSize.height * 0.5,
                  width: screenSize.width > 780 || screenSize.height > 850
                      ? screenSize.width * 0.45
                      : screenSize.width * 0.8,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(color: yellowColor, width: 1.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Giriş Yap text
                      const Text(
                        "Giriş Yap",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 28),
                      ),

                      ///Email input
                      MyTextFieldWidget(
                        hintText: "Email giriniz...",
                        title: "Email",
                        controller: emailController,
                        obscureText: false,
                      ),

                      ///Password input
                      MyTextFieldWidget(
                        hintText: "Şifre giriniz...",
                        title: "Şifre",
                        controller: passwordController,
                        obscureText: true,
                      ),

                      ///Giriş Yap button
                      Align(
                        alignment: Alignment.center,
                        child: MyCustomMainButton(
                            isLoading: false,
                            color: yellowColor,
                            onPressed: () async {
                              String output = await AuthMethods().signInUser(
                                  email: emailController.text,
                                  password: passwordController.text);

                              if (output == "success") {
                              } else {
                                Utils().showSnackBar(
                                    context: context, content: output);
                              }
                            },
                            child: const Text(
                              "Giriş yap",
                              style: TextStyle(
                                  letterSpacing: 0.6, color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                ///Amazon'da yeni misin?
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "  Amazon'da yeni misin?  ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),

                ///Üye Ol button
                MyCustomMainButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  // isLoading: true,
                  color: Colors.grey[400]!,
                  child: const Text(
                    "Kayıt ol",
                    style: TextStyle(letterSpacing: 0.6, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
