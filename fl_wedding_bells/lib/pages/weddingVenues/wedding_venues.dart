import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class WeddingVenuesScreen extends StatelessWidget {
  WeddingVenuesScreen({Key? key}) : super(key: key);

  final weddingVenue = [
    {"title": "Gallery Metro", "image": "assets/weddingVenues/venue1.png"},
    {"title": "Heaven on Earth", "image": "assets/weddingVenues/venue2.png"},
    {
      "title": "Sunset View Wedding",
      "image": "assets/weddingVenues/venue3.png"
    },
    {"title": "The Leela Goa", "image": "assets/weddingVenues/venue4.png"},
    {"title": "Serenity Grove", "image": "assets/weddingVenues/venue5.png"},
    {"title": "Della Resorts", "image": "assets/weddingVenues/venue6.png"},
    {
      "title": "Marigold Banquet Hall",
      "image": "assets/weddingVenues/venue7.png"
    },
    {"title": "Rainforest Resort", "image": "assets/weddingVenues/venue8.png"},
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'wedding_venue.famous_venue'),
        ),
      ),
      body: weddingvenuesList(size),
    );
  }

  weddingvenuesList(Size size) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          top: fixPadding,
          bottom: fixPadding * 2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: fixPadding * 2,
        crossAxisSpacing: fixPadding * 2,
        childAspectRatio: size.width / (size.height / 1.7),
      ),
      itemCount: weddingVenue.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/venuedetail');
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
                        "\$56 ${getTranslate(context, 'wedding_venue.onwards')}",
                        style: semibold14Primary,
                        overflow: TextOverflow.ellipsis,
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
