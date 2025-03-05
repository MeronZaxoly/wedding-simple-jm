import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class FaQsScreen extends StatelessWidget {
  FaQsScreen({Key? key}) : super(key: key);

  final list = [
    {"title": "How to book wedding venue?"},
    {"title": "How to change language"},
    {"title": "How to book photographer?"},
    {"title": "How to chat?"},
    {"title": "How to Find best venue?"},
    {"title": "How to book catering service?"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'faqs.faqs')),
      ),
      body: faqslists(),
    );
  }

  faqslists() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(
              vertical: fixPadding, horizontal: fixPadding * 2),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ExpansionTile(
              backgroundColor: whiteColor,
              iconColor: blackColor2,
              collapsedIconColor: blackColor2,
              title: Text(
                list[index]['title'].toString(),
                style: semibold16black2,
              ),
              childrenPadding: const EdgeInsets.only(
                left: fixPadding * 2,
                right: fixPadding * 2,
                bottom: fixPadding * 2,
              ),
              children: const [
                Text(
                  "Lorem ipsum dolor sit a consectetuadipiscing elit. Maecenas amet ut eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra, amet erat feugiat duis.Maecenas amet ut eget enibh lorem velit. Id ornare lectus mauris, maharetra, amet erat feugiat duis.eget eu nibh lorem velit. Id ornare lectus mauris, mauris. Pharetra,",
                  style: medium14Grey94,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
