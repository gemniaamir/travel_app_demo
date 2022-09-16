import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_cubits.dart';
import 'package:travel_app/navigation/home_page.dart';
import 'package:travel_app/screens/detail_page.dart';
import 'package:travel_app/screens/welcome_screen.dart';

import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
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
            return WelcomeScreen();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return HomePage();
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
