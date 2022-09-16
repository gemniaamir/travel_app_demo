// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/colors/colors.dart';
import 'package:travel_app/cubits/app_cubit_states.dart';
import 'package:travel_app/cubits/app_cubits.dart';

import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text%20copy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final imagePaths = [
    'assets/images/ballooning.png',
    'assets/images/kayak.png',
    'assets/images/trekking.png',
    'assets/images/snorkling.png',
  ];

  final imageNames = [
    'Ballooning',
    'Kayaking',
    'Trekking',
    'Snorkling',
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;

          return Container(
            padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
            height: double.maxFinite,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_sharp,
                        size: 30,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: 'Discover',
                  )),
              const SizedBox(
                height: 30,
              ),

              // TabBar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black.withOpacity(0.5),
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator:
                        TabIndicatorView(color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiration'),
                      Tab(text: 'Emotions'),
                    ],
                  ),
                ),
              ),

              // Tab Bar View
              Container(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            height: 300,
                            width: 200,
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'http://mark.bslmeiyu.com/uploads/${info[index].image}'),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Explore More',
                        size: 22,
                      ),
                      AppText(
                        text: 'See All',
                        color: AppColors.textColor1,
                      )
                    ]),
              ),
              Container(
                width: double.maxFinite,
                height: 110,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue.withOpacity(0.2),
                            ),
                            child: Center(
                              child: Image(
                                image: AssetImage(imagePaths[index]),
                                height: 45,
                                width: 45,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: AppText(
                              color: AppColors.textColor2,
                              text: imageNames[index],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ]),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class TabIndicatorView extends Decoration {
  final Color color;
  final double radius;

  const TabIndicatorView({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePaint(color: color, radius: radius);
  }
}

class CirclePaint extends BoxPainter {
  final Color color;
  final double radius;

  const CirclePaint({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = false;

    Offset _offset = Offset((configuration.size!.width / 2) - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(_offset + offset, radius, _paint);
  }
}
