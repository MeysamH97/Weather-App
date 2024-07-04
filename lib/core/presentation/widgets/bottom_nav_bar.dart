import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final PageController pageController;

  const BottomNavBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return BottomAppBar(
      surfaceTintColor: Colors.red,
      notchMargin: 5,
      color: primaryColor.withOpacity(0.1),
      elevation: 10,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              },
              highlightColor: Colors.white.withOpacity(0.25),
              icon: const Icon(
                Icons.home_rounded,
                size: 35,
                color: Colors.white,
              ),
            ),
            const SizedBox(),
            IconButton(
              onPressed: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              highlightColor: Colors.white.withOpacity(0.25),
              icon: const Icon(
                Icons.bookmark,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
