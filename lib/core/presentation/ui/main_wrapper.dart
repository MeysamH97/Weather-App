import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/widgets/app_background.dart';
import 'package:weather_app/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/bookmarks_feature/presentation/screens/bookmark_screen.dart';
import 'package:weather_app/features/weather__feature/presentation/screens/home_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  late List<Widget> appPages = [];
  @override
  void initState() {
    super.initState();
    appPages = [
      const HomeScreen(),
      BookMarkScreen(pageController: pageController,),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavBar(
          pageController: pageController,
        ),
        body: Container(
          height: Constants.height(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AppBackground.getBackGroundImage(),
              fit: BoxFit.cover
            ),
          ),
          child: PageView(
            controller: pageController,
            children: appPages,
          ),
        ),
      ),
    );
  }
}
