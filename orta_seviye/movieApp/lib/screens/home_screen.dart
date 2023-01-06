import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movieapp/components/masked_image.dart';
import 'package:movieapp/components/search_file_widget.dart';
import 'package:movieapp/models/movie.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 120,
                    sigmaY: 120,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'What would you\nlike to watch?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: Constants.kWhiteColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SearchFieldWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'New movies',
                      style: const TextStyle(
                          color: Constants.kWhiteColor, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == newMovies.length - 1) {
                          mask = Constants.kMaskLastIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 150,
                            width: 140,
                            child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: const Text(
                      'Upcoming movies',
                      style:
                          TextStyle(color: Constants.kWhiteColor, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == upcomingMovies.length - 1) {
                          mask = Constants.kMaskLastIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 150,
                            width: 140,
                            child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 55,
        height: 55,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.2),
                Constants.kGreenColor.withOpacity(0.2),
              ]),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(
              Constants.kIconPlus,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 58,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kGreenColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.kIconHome),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.kIconPlayOnTv),
                ),
              ),
              const Expanded(child: const Text('')),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.kIconCategories),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.kIconDownload),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
