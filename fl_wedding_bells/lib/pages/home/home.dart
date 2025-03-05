import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/column_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cityList = [
    {"name": "Surat", "id": 0},
    {"name": "Mumbai", "id": 1},
    {"name": "Delhi", "id": 3},
    {"name": "Hyderabad", "id": 4},
    {"name": "Pune", "id": 5},
    {"name": "Jaipur", "id": 6},
    {"name": "Ahmedabad", "id": 7},
    {"name": "Anand", "id": 8},
    {"name": "Jetpur", "id": 9},
    {"name": "Nagpur", "id": 10},
    {"name": "Vadodara", "id": 11},
    {"name": "Ghaziabad", "id": 12},
    {"name": "Agra", "id": 13},
    {"name": "Nashik", "id": 14},
  ];

  final categoriesList = [
    {
      "image": "assets/home/category1.png",
      "name": "Decoration",
    },
    {
      "image": "assets/home/category2.png",
      "name": "Makup",
    },
    {
      "image": "assets/home/category3.png",
      "name": "Catering",
    },
    {
      "image": "assets/home/category4.png",
      "name": "Bridal wear",
    },
    {
      "image": "assets/home/category5.png",
      "name": "Groom wear",
    },
    {
      "image": "assets/home/category6.png",
      "name": "Jewellery",
    },
    {
      "image": "assets/home/category7.png",
      "name": "Photographers",
    },
  ];

  final packageList = [
    {
      "title": "Sunset View Wedding",
      "guset": "25 guest(2 night)",
      "price": 56,
      "image": "assets/home/package1.png"
    },
    {
      "title": "Della Resorts",
      "guset": "45 guest(1 night)",
      "price": 56,
      "image": "assets/home/package2.png"
    },
    {
      "title": "The Leela Goa",
      "guset": "45 guest(1 night)",
      "price": 56,
      "image": "assets/home/package3.png"
    },
    {
      "title": "Rainforest Resort",
      "guset": "45 guest(1 night)",
      "price": 56,
      "image": "assets/home/package4.png"
    },
  ];

  final weddingVenue = [
    {"title": "Gallery Metro", "price": 56, "image": "assets/home/venue1.png"},
    {
      "title": "Sunset View Wedding",
      "price": 56,
      "image": "assets/home/venue2.png"
    },
    {"title": "Serenity Grove", "price": 56, "image": "assets/home/venue3.png"},
    {
      "title": "Rainforest Resort",
      "price": 56,
      "image": "assets/home/venue4.png"
    },
  ];

  final trandingDecor = [
    {
      "title": "Rainforest Resort",
      "price": 56,
      "image": "assets/home/decor1.png"
    },
    {"title": "Royal Oak", "price": 56, "image": "assets/home/decor2.png"},
    {
      "title": "Heaven on Earth",
      "price": 56,
      "image": "assets/home/decor3.png"
    },
    {
      "title": "Marigold Banquet Hall",
      "price": 56,
      "image": "assets/home/decor4.png"
    },
  ];

  String? selectedCityName;

  @override
  void initState() {
    selectedCityName = cityList[1]['name'].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          topImageContainer(size),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: fixPadding * 2),
              physics: const BouncingScrollPhysics(),
              children: [
                categoriesText(),
                heightSpace,
                categoriesListView(size),
                heightSpace,
                heightSpace,
                titleText(getTranslate(context, 'home.wedding_package'), () {
                  Navigator.pushNamed(context, '/weddingpackages');
                }),
                weddingPackageListview(size),
                heightSpace,
                titleText(getTranslate(context, 'home.wedding_venue'), () {
                  Navigator.pushNamed(context, '/weddingvenue');
                }),
                weddingVenueList(size),
                heightSpace,
                titleText(getTranslate(context, 'home.trending_decore'), () {
                  Navigator.pushNamed(context, '/trendingDecore');
                }),
                tradingDecorListView(size)
              ],
            ),
          )
        ],
      ),
    );
  }

  tradingDecorListView(Size size) {
    return SizedBox(
      height: size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trandingDecor.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/venuedetail');
            },
            child: Container(
              height: size.height * 0.28,
              width: size.width * 0.4,
              margin: const EdgeInsets.all(fixPadding),
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
                            trandingDecor[index]['image'].toString(),
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
                          trandingDecor[index]['title'].toString(),
                          overflow: TextOverflow.ellipsis,
                          style: semibold13black2,
                        ),
                        heightBox(3),
                        Text(
                          "\$${trandingDecor[index]['price']} ${getTranslate(context, 'home.onwards')}",
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
      ),
    );
  }

  weddingVenueList(Size size) {
    return SizedBox(
      height: size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weddingVenue.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/venuedetail');
            },
            child: Container(
              height: size.height * 0.28,
              width: size.width * 0.4,
              margin: const EdgeInsets.all(fixPadding),
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
                            weddingVenue[index]['image'].toString(),
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
                          weddingVenue[index]['title'].toString(),
                          overflow: TextOverflow.ellipsis,
                          style: semibold13black2,
                        ),
                        heightBox(3),
                        Text(
                          "\$${weddingVenue[index]['price']} ${getTranslate(context, 'home.onwards')}",
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
      ),
    );
  }

  weddingPackageListview(Size size) {
    return SizedBox(
      height: size.height * 0.29,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: packageList.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/packagedetail');
            },
            child: Container(
              height: size.height * 0.29,
              width: size.width * 0.4,
              margin: const EdgeInsets.all(fixPadding),
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
                          "\$${packageList[index]['price']} ${getTranslate(context, 'home.onwards')}",
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
      ),
    );
  }

  titleText(String title, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: bold16black2,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              getTranslate(context, 'home.view_all'),
              style: semibold13Primary,
            ),
          )
        ],
      ),
    );
  }

  categoriesListView(Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: categoriesList
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/venues');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.12,
                        width: size.height * 0.12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              e['image'].toString(),
                            ),
                          ),
                        ),
                      ),
                      height5Space,
                      Text(
                        e['name'].toString(),
                        style: semibold13black2,
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  categoriesText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'home.categories'),
        style: bold16black2,
      ),
    );
  }

  topImageContainer(Size size) {
    return SizedBox(
      height: size.height * 0.3,
      width: double.infinity,
      child: Stack(
        children: [
          image(size),
          searchContainer(size),
          citySelectNotificationRow(size)
        ],
      ),
    );
  }

  image(Size size) {
    return Container(
      height: size.height * 0.265,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/home/Rectangle 203.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff66909C).withOpacity(0.4),
              blackColor.withOpacity(0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  citySelectNotificationRow(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              selectCityDailog(context, size);
            },
            child: Row(
              children: [
                Text(
                  selectedCityName.toString(),
                  style: semibold16White,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: whiteColor,
                  size: 26,
                )
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
            icon: const Icon(
              CupertinoIcons.bell,
              color: whiteColor,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  searchContainer(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
        child: Container(
          height: size.height * 0.07,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
              const Icon(
                Icons.search,
                color: grey94Color,
              ),
              widthSpace,
              Text(
                getTranslate(context, 'home.search'),
                style: semibold16Grey,
              )
            ],
          ),
        ),
      ),
    );
  }

  selectCityDailog(BuildContext context, Size size) {
    return showDialog(
      barrierColor: blackColor.withOpacity(0.3),
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, set) {
          return AlertDialog(
            scrollable: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            titlePadding: const EdgeInsets.only(top: fixPadding * 2),
            title: Center(
              child: Text(
                getTranslate(context, 'home.select_city'),
                style: medium18Black,
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              child: ColumnBuilder(
                itemCount: cityList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        set(() {
                          selectedCityName = cityList[index]['name'].toString();
                        });
                      });
                      Navigator.pop(context);
                    },
                    leading: Container(
                      height: size.height * 0.03,
                      width: size.height * 0.03,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        border: selectedCityName == cityList[index]['name']
                            ? Border.all(
                                color: primaryColor,
                                width: 6,
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    ),
                    minLeadingWidth: 10,
                    title: Text(
                      cityList[index]['name'].toString(),
                      style: medium16Black,
                    ),
                  );
                },
              ),
            ),
          );
        });
      },
    );
  }
}
