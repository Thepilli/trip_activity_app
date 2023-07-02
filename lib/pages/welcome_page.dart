// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cubit_app/cubit/app_cubits.dart';
import 'package:cubit_app/utils/colors.dart';
import 'package:cubit_app/widgets/app_large_text.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:cubit_app/widgets/responsive_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome_one.png',
    'welcome_two.png',
    'welcome_three.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${images[index]}'),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: 'Trips'),
                      AppText(
                        text: 'Mountains',
                        size: 30,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text: 'Mountain hikes give you and opportunity to see the wonders of nature',
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(width: 150),
                                ],
                              ))),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: EdgeInsets.all(3),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
