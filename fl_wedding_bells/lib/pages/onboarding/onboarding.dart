import 'dart:io';

import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedIndex = 0;

  DateTime? backPressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pageModalList = [
      PageModel(
        widget: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/onboarding/Rectangle 64.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffFBF8F2).withOpacity(0),
                      const Color(0xffFBF8F2)
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        getTranslate(context, 'onboarding.text_1'),
                        style: bold18Primary,
                        textAlign: TextAlign.center,
                      ),
                      height5Space,
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus diam dui magna quam. Malesuada amet volutpat fusce urna. Nisi bibendum",
                        style: medium14Grey94,
                        textAlign: TextAlign.center,
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      PageModel(
        widget: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/onboarding/Rectangle 64 (1).png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffFBF8F2).withOpacity(0),
                      const Color(0xffFBF8F2)
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        getTranslate(context, 'onboarding.text_2'),
                        style: bold18Primary,
                        textAlign: TextAlign.center,
                      ),
                      height5Space,
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus diam dui magna quam. Malesuada amet volutpat fusce urna. Nisi bibendum",
                        style: medium14Grey94,
                        textAlign: TextAlign.center,
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      PageModel(
        widget: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/onboarding/Rectangle 64 (2).png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffFBF8F2).withOpacity(0),
                      const Color(0xffFBF8F2)
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        getTranslate(context, 'onboarding.text_3'),
                        style: bold18Primary,
                        textAlign: TextAlign.center,
                      ),
                      height5Space,
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus diam dui magna quam. Malesuada amet volutpat fusce urna. Nisi bibendum",
                        style: medium14Grey94,
                        textAlign: TextAlign.center,
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return PopScope(
      canPop: false,
      onPopInvoked: (bool key) {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
      },
      child: Scaffold(
        body: onboardingpages(pageModalList),
      ),
    );
  }

  onboardingpages(List<PageModel> pageModalList) {
    return Onboarding(
      pages: pageModalList,
      startPageIndex: selectedIndex,
      onPageChange: (index) {
        setState(
          () {
            selectedIndex = index;
          },
        );
      },
      footerBuilder: (context, dragDistance, pageLength, setIndex) {
        return Container(
          color: const Color(0xffFBF8F2),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedIndex == pageLength - 1
                  ? TextButton(
                      onPressed: null,
                      child: Text(
                        getTranslate(context, 'onboarding.skip'),
                        style: bold16Grey7E.copyWith(color: Colors.transparent),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        getTranslate(context, 'onboarding.skip'),
                        style: bold16Grey7E,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pageLength,
                  (index) => builddote(index),
                ),
              ),
              selectedIndex == pageLength - 1
                  ? TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        getTranslate(context, 'onboarding.login'),
                        style: bold16Primary,
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex++;
                        });
                      },
                      child: Text(
                        getTranslate(context, 'onboarding.next'),
                        style: bold16Primary,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  builddote(int index) {
    return Container(
      height: selectedIndex == index ? 8 : 8,
      width: selectedIndex == index ? 30 : 8,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding / 3),
      decoration: BoxDecoration(
        color:
            selectedIndex == index ? primaryColor : blackColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
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
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
