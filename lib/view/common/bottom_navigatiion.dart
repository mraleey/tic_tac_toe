import 'package:flutter/material.dart';

import '../../res/components/app_colors.dart';
import '../navigations/dashboard.dart';
import '../navigations/profile.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  BottomNavigationBarViewState createState() => BottomNavigationBarViewState();
}

class BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _currentIndex < _buildScreens().length
            ? _buildScreens()[_currentIndex]
            : _buildScreens().first,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: kLightColor,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              elevation: 1,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: kSecondaryColor,
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              selectedFontSize: 12,
              unselectedFontSize: 14,
              type: BottomNavigationBarType.shifting,
              selectedIconTheme:
                  const IconThemeData(color: kSecondaryColor, size: 30),
              unselectedIconTheme:
                  const IconThemeData(color: kLightColor, size: 20),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(color: kDarkColor),
              items: _navBarsItems(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const DashboardView(),
      const DashboardView(),
      ProfileView(),
    ];
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today), label: 'Attendance'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
  }
}
