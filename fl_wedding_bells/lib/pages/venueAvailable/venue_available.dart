import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class VenueAvailableScreen extends StatelessWidget {
  const VenueAvailableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          successDetail(size, context),
        ],
      ),
    );
  }

  successDetail(Size size, context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          const Spacer(),
          Column(
            children: [
              Image.asset(
                "assets/available/Group 726.png",
                height: size.height * 0.21,
                width: size.height * 0.21,
              ),
              heightSpace,
              heightSpace,
              Text(
                getTranslate(context, 'venue_available.venue_available'),
                style: medium20Black2,
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/creditcard');
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
                    blurRadius: 5,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                getTranslate(context, 'venue_available.book_now'),
                style: bold18White,
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }
}
