import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  final PageController pageController;

  const BottomNavBar({super.key, required this.pageController, });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    widget.pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Colors.black],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          updateCurrentIndex(index);
        },
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
              size: 35,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bookmarks',
            icon: Icon(
              Icons.bookmark_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
