import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);

  final reviews = [
    {
      "image": "assets/review/review1.png",
      "name": "Jerome Bell",
      "rate": 4.5,
      "date": "25 may 2022"
    },
    {
      "image": "assets/review/review2.png",
      "name": "Eleanor Pena",
      "rate": 3.5,
      "date": "22 may 2022"
    },
    {
      "image": "assets/review/review3.png",
      "name": "Ralph Edwards",
      "rate": 2.5,
      "date": "25 may 2022"
    },
    {
      "image": "assets/review/review4.png",
      "name": "Cody Fisher",
      "rate": 3.5,
      "date": "20 may 2022"
    },
    {
      "image": "assets/review/review5.png",
      "name": "Floyd Miles",
      "rate": 4.5,
      "date": "28 may 2022"
    },
    {
      "image": "assets/review/review6.png",
      "name": "Albert Flores",
      "rate": 4.5,
      "date": "29 may 2022"
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
        title: Text(getTranslate(context, 'review.review')),
      ),
      body: reviewlist(size),
    );
  }

  reviewlist(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: fixPadding * 2,
        right: fixPadding * 2,
        bottom: fixPadding,
      ),
      itemCount: reviews.length,
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
    );
  }
}
