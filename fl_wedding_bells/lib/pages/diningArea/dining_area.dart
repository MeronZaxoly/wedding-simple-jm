import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class DiningArea extends StatelessWidget {
  DiningArea({Key? key}) : super(key: key);

  final diningArea = [
    "assets/diningArea/Rectangle 227.png",
    "assets/diningArea/Rectangle 228.png",
    "assets/diningArea/Rectangle 227 (1).png",
    "assets/diningArea/Rectangle 228 (1).png",
    "assets/diningArea/Rectangle 227 (2).png",
    "assets/diningArea/Rectangle 228 (2).png",
    "assets/diningArea/Rectangle 227 (3).png",
    "assets/diningArea/Rectangle 228 (3).png",
    "assets/diningArea/Rectangle 227 (4).png",
    "assets/diningArea/Rectangle 228 (4).png"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'dining_area.dining_area')),
      ),
      body: diningAreaslist(size),
    );
  }

  diningAreaslist(Size size) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: fixPadding * 2,
        mainAxisSpacing: fixPadding * 2,
        childAspectRatio: size.width / (size.height / 1.8),
      ),
      itemCount: diningArea.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: fixPadding * 2,
        right: fixPadding * 2,
        bottom: fixPadding * 2,
        top: fixPadding,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                diningArea[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
