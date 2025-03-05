import 'dart:io';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../screens.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  final pages = [
    const HomeScreen(),
    VendorsScreen(),
    const TaskScreen(),
    MessageScreen(),
    const ProfileScreen(),
  ];

  DateTime? backPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool key) {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
      },
      child: Scaffold(
        body: pages.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteColor,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedLabelStyle: semibold13Primary,
          unselectedLabelStyle: semibold13Primary,
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: const Color(0xffB4B4B4),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: getTranslate(context, 'bottom_navigation.home'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.storefront_outlined),
              label: getTranslate(context, 'bottom_navigation.vendors'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.date_range_outlined),
              label: getTranslate(context, 'bottom_navigation.task'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.ellipses_bubble),
              label: getTranslate(context, 'bottom_navigation.message'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(LineAwesomeIcons.user_tie),
              label: getTranslate(context, 'bottom_navigation.profile'),
            ),
          ],
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) > const Duration(seconds: 2)) {
      backPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blackColor,
          content: Text(
            getTranslate(context, 'exit_app.app_exit'),
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          duration: const Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
