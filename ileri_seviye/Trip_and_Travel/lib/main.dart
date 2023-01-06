import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_and_travel/cubit/app_cubit_logics.dart';
import 'package:trip_and_travel/cubit/app_cubits.dart';
import 'package:trip_and_travel/pages/detail_page.dart';
import 'package:trip_and_travel/pages/navpages/main_page.dart';
import 'package:trip_and_travel/pages/welcome_page.dart';
import 'package:trip_and_travel/pages/home_page.dart';
import 'package:trip_and_travel/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
        ///create the cubit
        create: (context) => AppCubits(
          data: DataServices(),
        ),

        ///show this
        child: AppCubitLogics(),
      ),
    );
  }
}
