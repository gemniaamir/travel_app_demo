import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/colors/colors.dart';
import 'package:travel_app/cubits/app_cubits.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text%20copy.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final imageNames = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png',
  ];

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.imageNames.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imageNames[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(
                top: 150,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: 'Trips'),
                      AppText(
                        text: 'Mountains',
                        color: Colors.black87,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              'Mountain hikes give you an incredile sense of freedom alongwith endurance text',
                          color: AppColors.textColor2,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    width: 120,
                                  ),
                                ],
                              ))),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.all(2),
                          height: indexDots == index ? 25 : 8,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: indexDots == index
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.3)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
