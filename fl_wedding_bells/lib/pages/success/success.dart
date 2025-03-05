import 'dart:async';
import 'dart:io';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/bottomNavigation');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool key) {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            successContent(size, context),
          ],
        ),
      ),
    );
  }

  successContent(Size size, BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            "assets/available/Group 726.png",
            height: size.height * 0.21,
            width: size.height * 0.21,
          ),
          heightSpace,
          heightSpace,
          Text(
            getTranslate(context, 'success.booking_success'),
            style: medium20Black2,
          ),
          const Spacer(),
          Text(
            getTranslate(context, 'success.back_home'),
            style: semibold16Primary,
          ),
          heightSpace,
        ],
      ),
    );
  }

  onWillPop() {}
}
