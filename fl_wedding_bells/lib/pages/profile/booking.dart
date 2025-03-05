import 'package:dotted_border/dotted_border.dart';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final bookings = [
    {
      "image": "assets/profile/booking1.png",
      "name": "Blue Sea Banquets",
      "rate": 4.5,
      "guest": 250,
      "title": "Venue booking",
    },
    {
      "image": "assets/profile/booking2.png",
      "name": "Jerome catering service",
      "rate": 3.5,
      "guest": 250,
      "title": "Catering booking",
    },
    {
      "image": "assets/profile/booking3.png",
      "name": "Brook photographers",
      "rate": 4.5,
      "title": "Photographers",
    },
    {
      "image": "assets/profile/booking4.png",
      "name": "Brook photographers",
      "rate": 4.5,
      "title": "Bridal gown",
    },
    {
      "image": "assets/profile/booking5.png",
      "name": "Brook photographers",
      "rate": 4.5,
      "title": "Makup artist",
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
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'booking.booking')),
      ),
      body: bookings.isEmpty ? emptybookingText(size) : bookingListview(size),
    );
  }

  emptybookingText(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/profile/Group 67 (1).png",
            height: size.height * 0.08,
            width: size.height * 0.09,
          ),
          heightSpace,
          Text(
            getTranslate(context, 'booking.no_booking'),
            style: semibold16Grey,
          ),
          heightSpace,
        ],
      ),
    );
  }

  bookingListview(Size size) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: bookings.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookingInformation(size, index, context),
            bookings.length - 1 == index ? const SizedBox() : divider(),
          ],
        );
      },
    );
  }

  divider() {
    return DottedBorder(
      padding: EdgeInsets.zero,
      color: primaryColor,
      dashPattern: const [2, 3],
      child: Container(),
    );
  }

  bookingInformation(Size size, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookings[index]['title'].toString(),
            style: bold16black2,
          ),
          heightSpace,
          Container(
            width: double.maxFinite,
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
                              bookings[index]['image'].toString(),
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
                              bookings[index]['name'].toString(),
                              style: semibold15Black2,
                            ),
                            height5Space,
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star_border,
                                        size: 16, color: grey94Color),
                                    width5Space,
                                    Text(
                                      bookings[index]['rate'].toString(),
                                      style: semibold13Grey,
                                    )
                                  ],
                                ),
                                widthSpace,
                                bookings[index]['guest'] == null
                                    ? const SizedBox()
                                    : Row(
                                        children: [
                                          const Icon(Icons.people_outline,
                                              size: 16, color: grey94Color),
                                          width5Space,
                                          Text(
                                            "${bookings[index]['guest']} ${getTranslate(context, 'booking.guest')}",
                                            style: semibold13Grey,
                                          )
                                        ],
                                      ),
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
                                  getTranslate(context, 'booking.message'),
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
                                  getTranslate(context, 'booking.call'),
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
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      top: fixPadding * 2, bottom: fixPadding),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/profile/Group 67.png",
                                        height: size.height * 0.07,
                                        width: size.height * 0.07,
                                      ),
                                      heightSpace,
                                      heightSpace,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: fixPadding * 2),
                                        child: Text(
                                          getTranslate(
                                              context, 'booking.remove_text'),
                                          style: medium15Black2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      heightSpace,
                                      heightSpace,
                                      DottedBorder(
                                        padding: EdgeInsets.zero,
                                        dashPattern: const [2, 3],
                                        color: primaryColor,
                                        child: Container(),
                                      ),
                                      heightSpace,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: fixPadding),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                getTranslate(
                                                    context, 'booking.no'),
                                                style: semibold16Black,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  bookings.removeAt(index);
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                getTranslate(
                                                    context, 'booking.yes'),
                                                style: semibold16Primary,
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
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.delete_outline,
                                color: primaryColor,
                                size: 20,
                              ),
                              width5Space,
                              Expanded(
                                child: Text(
                                  getTranslate(context, 'booking.remove'),
                                  style: semibold14Primary,
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
          ),
        ],
      ),
    );
  }
}
