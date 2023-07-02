// ignore_for_file: prefer_const_constructors

import 'package:cubit_app/cubit/app_cubit_states.dart';
import 'package:cubit_app/cubit/app_cubits.dart';
import 'package:cubit_app/pages/detail_pages/detail_page.dart';
import 'package:cubit_app/pages/navpages/main_page.dart';
import 'package:cubit_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
