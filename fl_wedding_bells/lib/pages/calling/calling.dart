import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  bool isMicOff = true;
  bool isVolumeOff = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightBox(size.height * 0.1),
                  callingInfo(size),
                  const Spacer(),
                  callingIcons(size, context),
                  heightBox(size.height * 0.08),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  callingIcons(Size size, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isMicOff = !isMicOff;
                });
              },
              child: Container(
                height: size.height * 0.07,
                width: size.height * 0.07,
                decoration: BoxDecoration(
                  color: isMicOff == true
                      ? grey94Color.withOpacity(0.5)
                      : primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isMicOff == true ? Icons.mic_off_outlined : Icons.mic_none,
                  color: whiteColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isVolumeOff = !isVolumeOff;
                });
              },
              child: Container(
                height: size.height * 0.07,
                width: size.height * 0.07,
                decoration: BoxDecoration(
                  color: isVolumeOff == true
                      ? grey94Color.withOpacity(0.5)
                      : primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isVolumeOff == true ? Icons.volume_off : Icons.volume_up,
                  color: whiteColor,
                ),
              ),
            ),
            Container(
              height: size.height * 0.07,
              width: size.height * 0.07,
              decoration: BoxDecoration(
                color: grey94Color.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.ellipses_bubble,
                color: whiteColor,
              ),
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            decoration: const BoxDecoration(
              color: Color(0xffFC1515),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.call_end,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  callingInfo(Size size) {
    return Column(
      children: [
        Text(
          getTranslate(context, 'calling.calling'),
          style: medium18Grey,
        ),
        heightSpace,
        heightSpace,
        Container(
          height: size.height * 0.13,
          width: size.height * 0.13,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/calling/Ellipse 74.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          getTranslate(context, 'calling.name'),
          style: semibold18black2,
        )
      ],
    );
  }
}
