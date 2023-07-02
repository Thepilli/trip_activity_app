import 'package:cubit_app/cubit/app_cubit_logics.dart';
import 'package:cubit_app/cubit/app_cubits.dart';
import 'package:cubit_app/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      title: 'Traveling app',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: const AppCubitLogics(),
      ),
    );
  }
}
