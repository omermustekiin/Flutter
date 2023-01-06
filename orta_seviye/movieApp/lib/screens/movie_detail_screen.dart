import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/components/masked_image.dart';
import 'package:movieapp/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xff29292b),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.54,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/movie-posters/img-eternals.jpg'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: SvgPicture.asset(
                        'assets/svg/icon-back.svg',
                      ),
                    ), //Menu Button
                    Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: SvgPicture.asset(
                        'assets/svg/icon-menu.svg',
                      ),
                    ), //Menu Button
                  ],
                ),
              ),
            ),
            Positioned(
              right: 9,
              top: screenHeight * 0.4,
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.yellowAccent, Colors.orangeAccent],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreyColor,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Constants.kWhiteColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.5,
                transform:
                    Matrix4.translationValues(0, -screenHeight * 0.05, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            'Eternals',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Constants.kWhiteColor.withOpacity(0.85),
                            ),
                          ),
                          SizedBox(height: screenHeight <= 667 ? 6 : 12),
                          Text(
                            '2021 | Action-Adventure-Fantasy | 2h36m',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Constants.kWhiteColor.withOpacity(0.85),
                            ),
                          ),
                          SizedBox(height: 15),
                          RatingBar.builder(
                            unratedColor: Constants.kWhiteColor,
                            itemSize: 14,
                            itemCount: 5,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                            itemBuilder: (context, _) => const Icon(Icons.star,
                                color: Constants.kYellowColor),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.',
                            style: TextStyle(
                                color: Constants.kWhiteColor.withOpacity(0.82),
                                fontSize: 14),
                            textAlign: TextAlign.center,
                            maxLines: screenHeight <= 667 ? 2 : 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      height: 2,
                      width: screenHeight * 0.37,
                      color: Constants.kWhiteColor.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Casts',
                                style: TextStyle(
                                    color: Constants.kWhiteColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight <= 667 ? 1 : 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Constants.kWhiteColor,
                                minRadius: 16,
                                maxRadius: screenWidth <= 375 ? 25 : 25,
                                backgroundImage: NetworkImage(
                                    'https://assets.playbill.com/head-shots/Sea-Wall-A-Life-J.-Gyllenhaal-Cropped-1.png'),
                              ),
                              Expanded(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 50,
                                  ),
                                  transform:
                                      Matrix4.translationValues(-6, 0, 0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: const [
                                      MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jack\nGylenhall',
                                            style: TextStyle(
                                                color: Constants.kWhiteColor,
                                                fontSize: 13),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Constants.kWhiteColor,
                                minRadius: 16,
                                maxRadius: screenWidth <= 375 ? 25 : 25,
                                backgroundImage: NetworkImage(
                                    'https://assets.playbill.com/head-shots/Sea-Wall-A-Life-J.-Gyllenhaal-Cropped-1.png'),
                              ),
                              Expanded(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 50,
                                    maxWidth: 110,
                                  ),
                                  transform:
                                      Matrix4.translationValues(-6, 0, 0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: const [
                                      MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jack\nGylenhall',
                                            style: TextStyle(
                                                color: Constants.kWhiteColor,
                                                fontSize: 13),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /*   Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Constants.kWhiteColor,
                                minRadius: 16,
                                maxRadius: screenWidth <= 375 ? 30 : 40,
                                backgroundImage: NetworkImage(
                                    'https://assets.playbill.com/head-shots/Sea-Wall-A-Life-J.-Gyllenhaal-Cropped-1.png'),
                              ),
                               Expanded(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 50,
                                    maxWidth: 110,
                                  ),
                                  transform:
                                  Matrix4.translationValues(-6, 0, 0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: const [
                                      MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jack\nGylenhall',
                                            style: TextStyle(
                                                color: Constants.kWhiteColor,
                                                fontSize: 13),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 50,
                                    maxWidth: 110,
                                  ),
                                  transform:
                                      Matrix4.translationValues(-6, 0, 0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: const [
                                      MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Jack\nGylenhall',
                                            style: TextStyle(
                                                color: Constants.kWhiteColor,
                                                fontSize: 13),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ) //Casts part
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
