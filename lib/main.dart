import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_cubit_logics.dart';
import 'package:travel_app/cubits/app_cubits.dart';
import 'package:travel_app/navigation/main_paga.dart';
import 'package:travel_app/screens/detail_page.dart';
import 'package:travel_app/screens/welcome_screen.dart';
import 'package:travel_app/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
          )),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DetailPage();
  }
}
