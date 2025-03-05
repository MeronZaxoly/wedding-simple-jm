import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VenuesScreen extends StatefulWidget {
  const VenuesScreen({Key? key}) : super(key: key);

  @override
  State<VenuesScreen> createState() => _VenuesScreenState();
}

class _VenuesScreenState extends State<VenuesScreen> {
  TextEditingController searchController = TextEditingController();

  final venues = [
    {
      "image": "assets/venue/venue1.png",
      "name": "Blue Sea Banquets",
      "rate": 4.5,
      "guest": 250,
      "price": 150,
      "isfavorite": false,
    },
    {
      "image": "assets/venue/venue2.png",
      "name": "The Tamarind Tree",
      "rate": 4.5,
      "guest": 250,
      "price": 350,
      "isfavorite": false,
    },
    {
      "image": "assets/venue/venue3.png",
      "name": "Fiestaa Resort-n-Events",
      "rate": 4.5,
      "guest": 350,
      "price": 450,
      "isfavorite": false,
    },
    {
      "image": "assets/venue/venue4.png",
      "name": "Mallu Farms",
      "rate": 4.5,
      "guest": 550,
      "price": 250,
      "isfavorite": false,
    },
    {
      "image": "assets/venue/venue5.png",
      "name": "Dream Valley Resorts",
      "rate": 4.5,
      "guest": 150,
      "price": 110,
      "isfavorite": false,
    },
    {
      "image": "assets/venue/venue6.png",
      "name": "Arsim International",
      "rate": 4.5,
      "guest": 450,
      "price": 350,
      "isfavorite": false,
    },
    {
      "image": "assets/venue/venue7.png",
      "name": "Park Plaza Zirakpur",
      "rate": 4.5,
      "guest": 250,
      "price": 150,
      "isfavorite": false,
    },
  ];

  bool? isfavorite;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: false,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslate(context, 'venues.venue'),
        ),
      ),
      body: Column(
        children: [
          height5Space,
          serachField(context),
          heightSpace,
          venuesListview(size)
        ],
      ),
    );
  }

  venuesListview(Size size) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: venues.length,
        padding: const EdgeInsets.only(bottom: fixPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/venuedetail');
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(fixPadding),
              margin: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2, vertical: fixPadding),
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
              child: Column(
                children: [
                  imagecontainer(index, size, context),
                  heightSpace,
                  detailText(index, size)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  detailText(int index, Size size) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                venues[index]['name'].toString(),
                style: semibold15Black2,
              ),
              height5Space,
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_border,
                        color: grey94Color,
                        size: 16,
                      ),
                      width5Space,
                      Text(
                        venues[index]['rate'].toString(),
                        style: semibold13Grey,
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
                        "${venues[index]['guest']} ${getTranslate(context, 'venues.guest')}",
                        style: semibold13Grey,
                      )
                    ],
                  ),
                ],
              ),
              height5Space,
              Text(
                "\$${venues[index]['price']}",
                style: semibold16Primary,
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
    );
  }

  imagecontainer(int index, Size size, BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            venues[index]['image'].toString(),
            height: size.height * 0.23,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isfavorite = venues[index]['isfavorite'] as bool;
                  venues[index]['isfavorite'] = !isfavorite!;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color(0xffD1D1D1),
                    content: Text(
                      venues[index]['isfavorite'] == true
                          ? getTranslate(context, 'venues.add_shortlist')
                          : getTranslate(context, 'venues.remove_shortlist'),
                      style: const TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: const Duration(milliseconds: 1500),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(fixPadding / 2),
                child: Icon(
                  venues[index]['isfavorite'] == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: whiteColor,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  serachField(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
        child: TextField(
          keyboardType: TextInputType.text,
          controller: searchController,
          style: const TextStyle(height: 1.3),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              size: 22,
            ),
            hintText: getTranslate(context, 'venues.search_venues'),
            hintStyle: semibold16Grey,
          ),
        ),
      ),
    );
  }
}
