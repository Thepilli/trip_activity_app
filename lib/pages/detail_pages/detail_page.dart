// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cubit_app/cubit/app_cubit_states.dart';
import 'package:cubit_app/cubit/app_cubits.dart';
import 'package:cubit_app/utils/colors.dart';
import 'package:cubit_app/widgets/app_buttons.dart';
import 'package:cubit_app/widgets/app_large_text.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:cubit_app/widgets/responsive_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int numberOfStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(detail.place.img), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert_outlined),
                    color: AppColors.buttonBackgroud,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 70,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: Icon(Icons.menu),
                    color: AppColors.buttonBackgroud,
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: detail.place.name),
                            AppLargeText(text: '\$ ${detail.place.price}'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 20),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: index < detail.place.stars ? AppColors.starColor : AppColors.textColor2);
                              }),
                            ),
                            SizedBox(width: 10),
                            AppText(
                              text: '(${detail.place.stars})',
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        AppLargeText(text: 'People', size: 20),
                        SizedBox(height: 5),
                        AppText(text: 'Number of people in your group'),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: AppButtons(
                                    color: selectedIndex == index ? Colors.white : Colors.black,
                                    backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackgroud,
                                    borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackgroud,
                                    size: 50,
                                    icon: Icons.favorite_border,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        AppLargeText(text: 'Description', size: 20),
                        SizedBox(height: 20),
                        AppText(
                          text: detail.place.description,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                          color: AppColors.textColor2,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor2,
                          isIcon: true,
                          icon: Icons.favorite_border,
                          size: 60,
                        ),
                        SizedBox(width: 20),
                        ResponsiveButton(
                          isResposive: true,
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
