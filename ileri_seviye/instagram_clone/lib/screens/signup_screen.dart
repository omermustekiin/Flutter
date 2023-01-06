import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/consts%20&%20utils/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/widgets/snack_bar.dart';
import '../consts & utils/colors.dart';
import '../responsive/mobile_screen.dart';
import '../responsive/responsive_layout_screens.dart';
import '../responsive/web_screen.dart';
import '../widgets/myCircularProgressIndicator.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _img;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickkImage(ImageSource.gallery);
    setState(() {
      _img = img;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _img!,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != "sucessfully-sign-up") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),

              ///'Instagram' Svg Image
              SvgPicture.asset(
                "assets/images/instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),

              ///Circular Widget to accept and show our selected file
              Stack(
                children: [
                  _img != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_img!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTgxc5NnToC7fiR3CSmgZQBihEjoeQW1I0DABCwnJIruusx1vVaukqRZqMUC48eV45cM0&usqp=CAU"),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              ///Text Field for Username
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              ///Text Field for E-mail
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24),

              ///Text Field for Password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),

              ///Text Field for Bio
              TextFieldInput(
                textEditingController: _bioController,
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              ///Login Button
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor),
                  child: _isLoading
                      ? const MyCircularProgressIndicator()
                      : const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: Container(),
                flex: 2,
              ),

              ///Transitioning to already have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Dont have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        " Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
