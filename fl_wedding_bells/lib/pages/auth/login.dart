import 'dart:io';

import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/pages/profile/languages.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  DateTime? backPressTime;

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
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/auth/login (1).png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(fixPadding * 2),
            physics: const BouncingScrollPhysics(),
            children: [
              heightBox(size.height * 0.1),
              login(),
              height5Space,
              loginText(),
              heightSpace,
              heightSpace,
              heightSpace,
              phoneField(context),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              loginButton(size),
            ],
          ),
        ),
      ),
    );
  }

  loginButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25),
              blurRadius: 5,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'login.login'),
          style: bold18White,
        ),
      ),
    );
  }

  phoneField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'login.mobile_number'),
          style: semibold14black2,
        ),
        height5Space,
        height5Space,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: grey94Color.withOpacity(0.5),
                blurRadius: 5,
              )
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(primary: primaryColor)),
            child: IntlPhoneField(
              initialCountryCode: "IN",
              disableLengthCheck: true,
              showCountryFlag: false,
              dropdownIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: blackColor2,
              ),
              style: const TextStyle(height: 1.3),
              textAlign: selectedLanguagesIndex == 4
                  ? TextAlign.right
                  : TextAlign.left,
              dropdownIconPosition: IconPosition.trailing,
              controller: phoneController,
              dropdownTextStyle: bold15black2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'login.enter_number'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        )
      ],
    );
  }

  loginText() {
    return Text(
      getTranslate(context, 'login.login_text'),
      style: semibold14Grey94,
    );
  }

  login() {
    return Text(
      getTranslate(context, 'login.login'),
      style: bold20Primary,
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
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
          content: Text(
            getTranslate(context, 'exit_app.app_exit'),
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
