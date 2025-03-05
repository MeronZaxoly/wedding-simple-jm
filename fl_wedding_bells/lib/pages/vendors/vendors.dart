import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/pages/profile/languages.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  VendorsScreen({Key? key}) : super(key: key);

  final vendors = [
    {
      "image": "assets/vendors/vendors1.png",
      "name": "Venue",
      "desc": "Farmhose, lawn, banquets hall"
    },
    {
      "image": "assets/vendors/vendors2.png",
      "name": "Decor",
      "desc": "Wedding planners, decoration"
    },
    {
      "image": "assets/vendors/vendors3.png",
      "name": "Catering",
      "desc": "Catering service, cake"
    },
    {
      "image": "assets/vendors/vendors4.png",
      "name": "Makup artist",
      "desc": "Bridal makup, family makup"
    },
    {
      "image": "assets/vendors/vendors5.png",
      "name": "Bridal wear",
      "desc": "Bridal lehengas, Gowns"
    },
    {
      "image": "assets/vendors/vendors6.png",
      "name": "Groom wear",
      "desc": "Shervani, wedding suits"
    },
    {
      "image": "assets/vendors/vendors7.png",
      "name": "Photographers",
      "desc": "Video, photographer"
    },
    {
      "image": "assets/vendors/vendors8.png",
      "name": "Jewellery",
      "desc": "Bridal jewellery"
    },
    {
      "image": "assets/vendors/vendors9.png",
      "name": "Invitation",
      "desc": "Invitation card"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        automaticallyImplyLeading: false,
        title: Text(getTranslate(context, 'vendors.vendors')),
      ),
      body: vendorslistview(size),
    );
  }

  vendorslistview(Size size) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: fixPadding * 2,
        right: fixPadding * 2,
        bottom: fixPadding,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: vendors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/venues');
          },
          child: Container(
            height: size.height * 0.13,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
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
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: selectedLanguagesIndex == 4
                      ? const BorderRadius.horizontal(
                          right: Radius.circular(10))
                      : const BorderRadius.horizontal(
                          left: Radius.circular(10)),
                  child: Image.asset(
                    vendors[index]['image'].toString(),
                    width: size.width * 0.3,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        vendors[index]['name'].toString(),
                        style: semibold16black2,
                      ),
                      height5Space,
                      Text(
                        vendors[index]['desc'].toString(),
                        style: medium14Grey94,
                      ),
                    ],
                  ),
                ),
                widthSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
