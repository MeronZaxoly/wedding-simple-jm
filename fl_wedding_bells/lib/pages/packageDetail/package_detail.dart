import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/widget/column_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../theme/theme.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  bool isFavorite = false;

  final albums = [
    {
      "image": "assets/packageDetail/album1.png",
      "title": "Main hall",
      "Noimage": 150
    },
    {
      "image": "assets/packageDetail/album2.png",
      "title": "Dining area",
      "Noimage": 20
    },
    {
      "image": "assets/packageDetail/album3.png",
      "title": "Dj party",
      "Noimage": 10
    },
    {
      "image": "assets/packageDetail/album4.png",
      "title": "Garden",
      "Noimage": 30
    },
  ];

  final similar = [
    {
      "image": "assets/packageDetail/similarPackage1.png",
      "title": "Sunset View Wedding ",
      "guest": "25 guest(2 night)"
    },
    {
      "image": "assets/packageDetail/similarPackage2.png",
      "title": "Della Resorts",
      "guest": "45 guest(1 night)"
    },
    {
      "image": "assets/packageDetail/similarPackage3.png",
      "title": "The Leela Goa",
      "guest": "45 guest(1 night)"
    },
    {
      "image": "assets/packageDetail/similarPackage4.png",
      "title": "Rainforest Resort",
      "guest": "45 guest(1 night)"
    },
  ];

  final reviews = [
    {
      "image": "assets/packageDetail/review1.png",
      "name": "Jerome Bell",
      "rate": 4.5,
      "date": "25 may 2022"
    },
    {
      "image": "assets/packageDetail/review2.png",
      "name": "Eleanor Pena",
      "rate": 3.5,
      "date": "22 may 2022"
    },
    {
      "image": "assets/packageDetail/review3.png",
      "name": "Ralph Edwards",
      "rate": 2.5,
      "date": "20 may 2022"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
            ),
            centerTitle: false,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color(0xffD1D1D1),
                      content: Text(
                        isFavorite
                            ? getTranslate(
                                context, 'package_detail.add_shortlist')
                            : getTranslate(
                                context, 'package_detail.remove_shortlist'),
                        style: const TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(milliseconds: 1500),
                    ),
                  );
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: whiteColor,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_outlined,
                  color: whiteColor,
                  size: 22,
                ),
              )
            ],
            backgroundColor: primaryColor,
            expandedHeight: size.height * 0.28,
            flexibleSpace: FlexibleSpaceBar(
              background: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/albums');
                },
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/packageDetail/image.png",
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: fixPadding / 2,
                          horizontal: fixPadding,
                        ),
                        decoration: const BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          "150 ${getTranslate(context, 'package_detail.image')}",
                          style: semibold16Primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                detaiText(context, size),
                divider(),
                heightSpace,
                heightSpace,
                aboutText(),
                heightSpace,
                heightSpace,
                divider(),
                heightSpace,
                heightSpace,
                paymentDetail(),
                heightSpace,
                heightSpace,
                divider(),
                heightSpace,
                heightSpace,
                areaAvailableOption(size),
                heightSpace,
                heightSpace,
                divider(),
                heightSpace,
                heightSpace,
                albumList(size),
                heightSpace,
                divider(),
                heightSpace,
                heightSpace,
                similarVenuesList(size),
                heightSpace,
                divider(),
                heightSpace,
                heightSpace,
                reviewList(size),
                heightSpace,
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomButton(size),
    );
  }

  bottomButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/availability');
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25),
              blurRadius: 5,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'package_detail.check_availability'),
          style: bold18White,
        ),
      ),
    );
  }

  reviewList(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'package_detail.review'),
            style: semibold16black2,
          ),
          ColumnBuilder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: fixPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.065,
                          width: size.height * 0.065,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                reviews[index]['image'].toString(),
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        width5Space,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reviews[index]['name'].toString(),
                                style: medium16Black2,
                              ),
                              height5Space,
                              Text(
                                reviews[index]['date'].toString(),
                                style: medium13Grey94,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_border,
                                color: primaryColor,
                                size: 15,
                              ),
                              width5Space,
                              Text(
                                reviews[index]['rate'].toString(),
                                style: bold13Primary,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    heightSpace,
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc, in eleifend lacus, ametenihendretincidunt. Venenatis pretium ultricies sem fringilla. Est, senectuskj integer et sagittis proin placerat. Eget non volutpathgh donec dis quam nunc, cursussenectus.  Est, senectuskj ",
                      style: medium13Grey94,
                    )
                  ],
                ),
              );
            },
            itemCount: reviews.length,
          )
        ],
      ),
    );
  }

  similarVenuesList(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          child: Text(
            getTranslate(context, 'package_detail.similar_package'),
            style: semibold16black2,
          ),
        ),
        SizedBox(
          height: size.height * 0.3,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(fixPadding),
            scrollDirection: Axis.horizontal,
            itemCount: similar.length,
            itemBuilder: (context, index) {
              return Container(
                height: size.height * 0.3,
                width: size.width * 0.4,
                margin: const EdgeInsets.symmetric(horizontal: fixPadding),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              similar[index]['image'].toString(),
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.all(fixPadding / 2),
                              margin: const EdgeInsets.all(fixPadding / 2),
                              decoration: BoxDecoration(
                                color: yellowColor,
                                borderRadius: BorderRadius.circular(5),
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
                    Padding(
                      padding: const EdgeInsets.all(fixPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            similar[index]['title'].toString(),
                            style: semibold13black2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            similar[index]['guest'].toString(),
                            style: semibold12Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "\$56 ${getTranslate(context, 'package_detail.onward')}",
                            style: semibold13Primary,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  albumList(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslate(context, 'package_detail.albums'),
                style: semibold16black2,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/albums');
                },
                child: Text(
                  getTranslate(context, 'package_detail.view_all'),
                  style: semibold13Primary,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.29,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(fixPadding),
            scrollDirection: Axis.horizontal,
            itemCount: albums.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/diningArea');
                },
                child: Container(
                  height: size.height * 0.29,
                  width: size.width * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: fixPadding),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.asset(albums[index]['image'].toString(),
                              fit: BoxFit.cover, width: double.maxFinite),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(fixPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              albums[index]['title'].toString(),
                              style: semibold13black2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${albums[index]['Noimage']} ${getTranslate(context, 'package_detail.view_all')}",
                              style: semibold13Grey,
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
        )
      ],
    );
  }

  areaAvailableOption(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'package_detail.areas_available'),
            style: semibold16black2,
          ),
          heightSpace,
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(fixPadding),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/venueDetail/coffee-shop 1.png",
                        height: size.height * 0.04,
                        width: size.height * 0.04,
                        color: primaryColor,
                      ),
                      widthSpace,
                      widthSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                getTranslate(context, 'package_detail.outdoor'),
                                style: semibold13black2,
                              ),
                            ),
                            height5Space,
                            FittedBox(
                              child: Text(
                                "250 ${getTranslate(context, 'package_detail.seats')}",
                                style: semibold13Grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(fixPadding),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/venueDetail/plant 1.png",
                        height: size.height * 0.04,
                        width: size.height * 0.04,
                        color: primaryColor,
                      ),
                      widthSpace,
                      widthSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                getTranslate(context, 'package_detail.indoor'),
                                style: semibold13black2,
                              ),
                            ),
                            height5Space,
                            FittedBox(
                              child: Text(
                                "300 ${getTranslate(context, 'package_detail.seats')}",
                                style: semibold13Grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  paymentDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'package_detail.package_price'),
            style: semibold16black2,
          ),
          heightSpace,
          Text(
            "\$5600 ${getTranslate(context, 'package_detail.onwards')}",
            style: semibold16Primary,
          ),
          Text(
            getTranslate(context, 'package_detail.include_all'),
            style: semibold12Grey,
          )
        ],
      ),
    );
  }

  aboutText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'package_detail.about'),
            style: semibold16black2,
          ),
          heightSpace,
          ReadMoreText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc, in eleifend lacus, ametenihendrerit tincidunt. Venenatis pretium ultricies sem fringilla. Est, senectus integer et sagittis proin placerat. Eget non volutpat donec dis quam nunc, cursussenectus. Purus neque penatibus in ultrices nec.Ut pharetra, arcu sapien molestie nec",
            style: medium14Grey94,
            lessStyle: medium14Primary,
            moreStyle: medium14Primary,
            trimExpandedText: getTranslate(context, 'package_detail.show_less'),
            trimCollapsedText:
                getTranslate(context, 'package_detail.read_more'),
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      color: const Color(0xffD9D9D9),
      width: double.maxFinite,
      height: 1,
    );
  }

  detaiText(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Della resorts package",
                  style: semibold18Primary,
                ),
                height5Space,
                Row(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: blackColor2,
                          size: 16,
                        ),
                        width5Space,
                        Text(
                          "4.5",
                          style: medium13black2,
                        )
                      ],
                    ),
                    widthSpace,
                    widthSpace,
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: grey94Color,
                          size: 16,
                        ),
                        width5Space,
                        Text(
                          "250 ${getTranslate(context, 'package_detail.guest')}",
                          style: medium13black2,
                        )
                      ],
                    ),
                  ],
                ),
                height5Space,
                const Row(
                  children: [
                    Icon(
                      Icons.place_outlined,
                      color: grey94Color,
                      size: 17,
                    ),
                    widthSpace,
                    Expanded(
                      child: Text(
                        "4517 Washington Ave. Manchester, Kentucky 39495",
                        style: medium12Grey94,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          widthSpace,
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chat');
                },
                child: Container(
                  height: size.height * 0.058,
                  width: size.height * 0.058,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: grey94Color.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.chat_bubble_outline,
                    color: primaryColor,
                    size: 21,
                  ),
                ),
              ),
              widthSpace,
              width5Space,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/calling');
                },
                child: Container(
                  height: size.height * 0.058,
                  width: size.height * 0.058,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: grey94Color.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    CupertinoIcons.phone,
                    color: primaryColor,
                    size: 21,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
