import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class WeddingPackageScreen extends StatefulWidget {
  const WeddingPackageScreen({Key? key}) : super(key: key);

  @override
  State<WeddingPackageScreen> createState() => _WeddingPackageScreenState();
}

class _WeddingPackageScreenState extends State<WeddingPackageScreen> {
  final packageList = [
    {
      "title": "Sunset View Wedding",
      "guset": "25 guest(2 night)",
      "image": "assets/weddingPackages/package1.png"
    },
    {
      "title": "Heaven on Earth",
      "guset": "25 guest(2 night)",
      "image": "assets/weddingPackages/package2.png"
    },
    {
      "title": "Della Resorts",
      "guset": "45 guest(1 night)",
      "image": "assets/weddingPackages/package3.png"
    },
    {
      "title": "Best wedding package",
      "guset": "45 guest(1 night)",
      "image": "assets/weddingPackages/package4.png"
    },
    {
      "title": "The Leela Goa",
      "guset": "45 guest(1 night)",
      "image": "assets/weddingPackages/package5.png"
    },
    {
      "title": "Serenity Grove",
      "guset": "45 guest(1 night)",
      "image": "assets/weddingPackages/package6.png"
    },
    {
      "title": "Rainforest Resort",
      "guset": "45 guest(1 night)",
      "image": "assets/weddingPackages/package7.png"
    },
    {
      "title": "Your budget package",
      "guset": "45 guest(1 night)",
      "image": "assets/weddingPackages/package8.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: whiteColor,
        elevation: 0,
        foregroundColor: blackColor2,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'wedding_packages.wedding_package')),
      ),
      body: weddingpackagelist(size),
    );
  }

  weddingpackagelist(Size size) {
    return GridView.builder(
      padding: const EdgeInsets.only(
          bottom: fixPadding * 2,
          top: fixPadding,
          left: fixPadding * 2,
          right: fixPadding * 2),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: fixPadding * 2,
        crossAxisSpacing: fixPadding * 2,
        childAspectRatio: size.width / (size.height / 1.6),
      ),
      itemCount: packageList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/packagedetail');
          },
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: grey94Color.withOpacity(0.5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.asset(
                          packageList[index]['image'].toString(),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.all(fixPadding / 2),
                          padding: const EdgeInsets.all(fixPadding / 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: yellowColor,
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_border,
                                color: primaryColor,
                                size: 15,
                              ),
                              width5Space,
                              Text(
                                "4.5",
                                style: bold13Primary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(fixPadding / 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        packageList[index]['title'].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: semibold13black2,
                      ),
                      heightBox(3),
                      Text(
                        packageList[index]['guset'].toString(),
                        style: semibold12Grey,
                      ),
                      heightBox(3),
                      Text(
                        "\$56 ${getTranslate(context, 'wedding_packages.onwards')}",
                        style: semibold14Primary,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
