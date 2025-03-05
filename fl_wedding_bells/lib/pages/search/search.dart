import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchHistory = [
    "Wedding venues",
    "Photographer",
    "Catering service",
    "Bridal lehenga",
    "Bridal jewellery",
    "Best decoration service",
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'search.search')),
      ),
      body: Column(
        children: [
          heightSpace,
          searchField(context),
          heightSpace,
          searchhistoryListview(),
        ],
      ),
    );
  }

  searchField(BuildContext context) {
    return Container(
      width: double.infinity,
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
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          style: const TextStyle(height: 1.3),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              size: 22,
            ),
            hintText: getTranslate(context, 'search.search'),
            hintStyle: semibold16Grey,
          ),
        ),
      ),
    );
  }

  searchhistoryListview() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: fixPadding),
        itemCount: searchHistory.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: fixPadding, horizontal: fixPadding * 2),
            child: Row(
              children: [
                const Icon(
                  Icons.restore,
                  color: grey84Color,
                  size: 22,
                ),
                widthSpace,
                width5Space,
                Text(
                  searchHistory[index],
                  style: medium16Grey84,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
