import 'dart:async';
import 'dart:io';

import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/theme.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourController = TextEditingController();

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
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              heightSpace,
              heightBox(size.height * 0.1),
              otp(),
              heightSpace,
              otpText(),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              otpFields(size, context),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              verifyButton(context, size),
              heightSpace,
              resendButton(),
            ],
          ),
        ),
      ),
    );
  }

  resendButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        getTranslate(context, 'otp.resend'),
        style: semibold16Primary,
      ),
    );
  }

  verifyButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, '/bottomNavigation');
        });
        pleaseDialog(context);
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25),
              blurRadius: 6,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'otp.verify'),
          style: bold18White,
        ),
      ),
    );
  }

  otpFields(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        firstField(size, context),
        widthSpace,
        widthSpace,
        secondField(size, context),
        widthSpace,
        widthSpace,
        thirdField(size, context),
        widthSpace,
        widthSpace,
        fourField(size, context),
      ],
    );
  }

  fourField(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            setState(
              () {
                if (value.length == 1) {
                  Timer(const Duration(seconds: 3), () {
                    Navigator.pushNamed(context, '/bottomNavigation');
                  });
                  pleaseDialog(context);
                }
              },
            );
          },
          controller: fourController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: semibold20Primary,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  pleaseDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2, vertical: fixPadding * 3),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpinKitFadingCircle(
                color: primaryColor,
                size: 40,
              ),
              heightSpace,
              Text(
                getTranslate(context, 'otp.please_wait'),
                style: semibold16Primary,
              )
            ],
          ),
        );
      },
    );
  }

  thirdField(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            setState(() {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            });
          },
          controller: thirdController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: semibold20Primary,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  secondField(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            setState(() {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            });
          },
          controller: secondController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: semibold20Primary,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  firstField(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            setState(() {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            });
          },
          controller: firstController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: semibold20Primary,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  otpText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'otp.otp_text'),
        style: semibold14Grey94,
        textAlign: TextAlign.center,
      ),
    );
  }

  otp() {
    return Text(
      getTranslate(context, 'otp.otp_verification'),
      style: bold20Primary,
      textAlign: TextAlign.center,
    );
  }

  onWillPop() {
    Navigator.pushNamed(context, '/login');
  }
}
