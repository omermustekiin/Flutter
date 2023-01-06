import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_and_travel/cubit/app_cubit_states.dart';
import 'package:trip_and_travel/cubit/app_cubits.dart';
import 'package:trip_and_travel/pages/detail_page.dart';
import 'package:trip_and_travel/pages/home_page.dart';
import '../pages/navpages/main_page.dart';
import '../pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is DetailState) {
            return DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
