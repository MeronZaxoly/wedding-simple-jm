import 'package:dotted_border/dotted_border.dart';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VenueShortList extends StatelessWidget {
  VenueShortList({Key? key}) : super(key: key);

  final venuesshortlist = [
    {
      "image": "assets/venueShortlist/shortlist1.png",
      "name": "Blue Sea Banquets",
    },
    {
      "image": "assets/venueShortlist/shortlist2.png",
      "name": "The Tamarind Tree",
    },
    {
      "image": "assets/venueShortlist/shortlist3.png",
      "name": "Mallu Farms",
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
        titleSpacing: 0,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          getTranslate(context, 'venue_shortlist.venues'),
        ),
      ),
      body: venuesShortlistview(size),
    );
  }

  venuesShortlistview(Size size) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      physics: const BouncingScrollPhysics(),
      itemCount: venuesshortlist.length,
      itemBuilder: (context, index) {
        return Container(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(fixPadding),
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.11,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(
                            venuesshortlist[index]['image'].toString(),
                          ),
                          fit: BoxFit.cover,
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
                            venuesshortlist[index]['name'].toString(),
                            style: semibold16black2,
                          ),
                          height5Space,
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.star_border,
                                      size: 16, color: grey94Color),
                                  width5Space,
                                  Text(
                                    "4.5",
                                    style: semibold13Grey,
                                  )
                                ],
                              ),
                              widthSpace,
                              Row(
                                children: [
                                  const Icon(Icons.people_outline,
                                      size: 16, color: grey94Color),
                                  width5Space,
                                  Text(
                                    "250 ${getTranslate(context, 'venue_shortlist.guest')}",
                                    style: semibold13Grey,
                                  )
                                ],
                              )
                            ],
                          ),
                          height5Space,
                          const Text(
                            "\$150",
                            style: semibold16Primary,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              height5Space,
              DottedBorder(
                padding: EdgeInsets.zero,
                dashPattern: const [2, 5],
                color: grey94Color,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: fixPadding, horizontal: fixPadding * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/chat');
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.chat_bubble_outline,
                              color: primaryColor,
                              size: 20,
                            ),
                            width5Space,
                            Expanded(
                              child: Text(
                                getTranslate(
                                    context, 'venue_shortlist.message'),
                                style: semibold14black2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/calling');
                        },
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.phone,
                              color: primaryColor,
                              size: 20,
                            ),
                            width5Space,
                            Expanded(
                              child: Text(
                                getTranslate(context, 'venue_shortlist.call'),
                                style: semibold14black2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/availability');
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: primaryColor,
                              size: 20,
                            ),
                            width5Space,
                            Expanded(
                              child: Text(
                                getTranslate(
                                    context, 'venue_shortlist.finalised'),
                                style: semibold14black2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
