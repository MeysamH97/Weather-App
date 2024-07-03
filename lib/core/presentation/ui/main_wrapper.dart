import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/widgets/app_background.dart';
import 'package:weather_app/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:weather_app/features/bookmarks_feature/presentation/screens/bookmark_screen.dart';
import 'package:weather_app/features/weather__feature/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> appPages = [
    const HomeScreen(),
    const BookmarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        pageController: pageController,
      ),
      body: Container(
        height: height,
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
    );
  }
}
