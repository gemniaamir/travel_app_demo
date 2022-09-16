import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/colors/colors.dart';
import 'package:travel_app/cubits/app_cubit_states.dart';
import 'package:travel_app/cubits/app_cubits.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text%20copy.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;

  Color getStarColor(int index, int gottenStar) {
    if (gottenStar > index) {
      return AppColors.starColor;
    } else {
      return AppColors.mainColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;

        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/${detail.place.image}'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<AppCubits>(context).goHome();
                },
                icon: const Icon(
                  Icons.menu_sharp,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.4) - 30,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.6) + 30,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0)),
                    color: Colors.white),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: detail.place.name),
                          AppLargeText(
                            text: '\$ ${detail.place.price}',
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blueGrey,
                          ),
                          AppText(
                            text: detail.place.location,
                            size: 14,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: getStarColor(
                                    index, detail.place.stars.toInt()),
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: detail.place.stars.toStringAsFixed(1),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppLargeText(
                        text: 'People',
                        size: 24,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: 'Number of people in your group',
                        size: 14,
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: AppButton(
                                  size: 60,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  text: '${index + 1}',
                                  isIcon: false,
                                  textColor: selectedIndex == index
                                      ? AppColors.mainTextColor
                                      : Colors.black),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: 'Description',
                        size: 24,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: detail.place.description,
                        color: AppColors.mainTextColor,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      isIcon: true,
                      icon: Icons.favorite_outline,
                      size: 60,
                      borderColor: AppColors.mainColor,
                      backgroundColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: ResponsiveButton(
                        isResponsive: true,
                        text: 'Book a tour',
                      ),
                    ),
                  ],
                )),
          ]),
        );
      },
    ));
  }
}
