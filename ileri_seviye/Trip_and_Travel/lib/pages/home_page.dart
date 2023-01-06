import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_and_travel/cubit/app_cubit_states.dart';
import 'package:trip_and_travel/cubit/app_cubits.dart';
import 'package:trip_and_travel/widgets_and_consts/colors.dart';

import 'package:trip_and_travel/widgets_and_consts/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "rafting.png": "Rafting",
    "balloning.png": "Balon",
    "zipline.jpg": "Zipline",
    "snowboard.png": "Snowboard",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {
            if (state is LoadedState) {
              var info = state.places;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///navbar
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                          ),
                          highlightColor: sekizNo.withOpacity(0.2),
                          iconSize: 36,
                          color: sekizNo,
                          onPressed: () {},
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 45,
                          height: 45,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/img/profile.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  ///Keşfet text
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: MyLargeText(text: "Keşfet", color: Colors.black)),
                  SizedBox(height: 25),

                  ///tabbar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black.withOpacity(0.4),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: yediNo,
                        /*  indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [besNo, ucNo, birNo],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),*/
                        indicator:
                            CircleTabIndicator(color: sekizNo, radius: 4),
                        tabs: [
                          Tab(
                            text: "Yerler",
                          ),
                          Tab(
                            text: "Fikirler",
                          ),
                          Tab(
                            text: "Tepkiler",
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///tabbarview (images)
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 280,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            itemCount: info.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(info[index]);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 15, top: 10),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              info[index].img),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  ///Daha fazla keşfet
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyLargeText(
                          text: "Daha fazla keşfet",
                          size: 20,
                          color: Colors.black,
                        ),
                        MyMiddleText(
                          text: "Hepsini gör",
                          color: Colors.grey[700]!,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  ///box images and texts
                  Container(
                    color: Colors.white,
                    height: 85,
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/img/" +
                                          images.keys.elementAt(index),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: MySmallText(
                                  text: images.values.elementAt(index),
                                  color: Colors.grey[700]!,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
    // TODO: implement paint
  }
}
