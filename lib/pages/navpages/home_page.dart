// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cubit_app/cubit/app_cubit_states.dart';
import 'package:cubit_app/cubit/app_cubits.dart';
import 'package:cubit_app/utils/colors.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'package:cubit_app/widgets/app_large_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // *** Local storage ***
  // List places = [
  //   'Mountains_1.png',
  //   'Mountains_2.png',
  //   'Mountains_3.png',
  //   'Mountains_4.png',
  // ];
  var activities = {
    'backpacking.png': 'Backpacking',
    'camping.png': 'Camping',
    'exploring.png': 'Exploring',
    'hiking.png': 'Hiking',
    'navigating.png': 'Navigating',
    'photo_shooting.png': 'Photo shooting',
  };

  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: AppLargeText(text: 'Discover'),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: tabController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelColor: Colors.cyan,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspirations'),
                    Tab(text: 'Emotions'),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: tabController,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                image: DecorationImage(image: AssetImage(info[index].img), fit: BoxFit.fill)),
                          ),
                        );
                      },
                    ),
                    Text("Inspiration body"),
                    Text("Emotions body"),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [AppLargeText(text: 'Explore more'), AppText(text: 'See all')]),
              ),
              SizedBox(height: 30),
              Container(
                height: 120,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 70,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.mainColor,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.mainColor.withOpacity(.5),
                                image: DecorationImage(image: AssetImage('assets/icons/${activities.keys.elementAt(index)}'))),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: AppText(
                              text: activities.values.elementAt(index),
                              color: AppColors.textColor2,
                              align: TextAlign.center,
                              size: 11,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
