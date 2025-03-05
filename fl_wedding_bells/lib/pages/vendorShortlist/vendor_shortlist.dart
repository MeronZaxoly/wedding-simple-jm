import 'package:dotted_border/dotted_border.dart';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/pages/profile/languages.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:fl_wedding_bells/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class VendorShortList extends StatefulWidget {
  const VendorShortList({Key? key}) : super(key: key);

  @override
  State<VendorShortList> createState() => _VendorShortListState();
}

class _VendorShortListState extends State<VendorShortList> {
  final shortlist = [
    {
      "image": "assets/vendorShortList/shortlist1.png",
      "title": "Venues",
      "result": 3
    },
    {
      "image": "assets/vendorShortList/shortlist2.png",
      "title": "Makup artist",
      "result": 3
    },
    {
      "image": "assets/vendorShortList/shortlist3.png",
      "title": "Jewellery",
      "result": 2
    },
    {
      "image": "assets/vendorShortList/shortlist4.png",
      "title": "Bridal wear",
      "result": 3
    },
  ];

  final addshortList = [
    "Groom wear",
    "Photographers",
    "Food",
    "Invitation",
    "Decoration"
  ];

  final emptyList = [
    "Venues",
    "Decoration",
    "Makup artist",
    "Jewellery",
    "Catering",
    "Photographers",
    "Bridal wear",
    "Groom wear",
    "Invitation",
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
        title: Text(getTranslate(context, 'vendor_shortlist.vendor_shortlist')),
      ),
      body:
          shortlist.isEmpty ? emptyshortlist(size) : vendorshortListview(size),
    );
  }

  emptyshortlist(Size size) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: fixPadding),
      physics: const BouncingScrollPhysics(),
      itemCount: emptyList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/venues');
          },
          child: Container(
            height: size.height * 0.13,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
                vertical: fixPadding, horizontal: fixPadding * 2),
            child: DottedBorder(
              color: blackColor,
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              dashPattern: const [3, 3],
              child: SizedBox(
                height: size.height * 0.13,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    widthSpace,
                    width5Space,
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            emptyList[index],
                            style: semibold16black2,
                          ),
                          height5Space,
                          Text(
                            getTranslate(
                                context, 'vendor_shortlist.add_shortlist'),
                            style: medium13Grey94,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  vendorshortListview(Size size) {
    return ListView(
      padding: const EdgeInsets.only(bottom: fixPadding),
      physics: const BouncingScrollPhysics(),
      children: [
        shortListView(size),
        addListview(size),
      ],
    );
  }

  shortListView(Size size) {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            extentRatio: 0.13,
            motion: const ScrollMotion(),
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    shortlist.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color(0xffD1D1D1),
                      content: Text(
                        getTranslate(
                            context, 'vendor_shortlist.removed_shortlist'),
                        style: const TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(milliseconds: 1500),
                    ),
                  );
                },
                child: Container(
                  height: size.height * 0.13,
                  padding: const EdgeInsets.symmetric(horizontal: fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffE24949),
                  ),
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/venueshortlist');
            },
            child: Container(
              height: size.height * 0.13,
              width: double.maxFinite,
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
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: selectedLanguagesIndex == 4
                        ? const BorderRadius.horizontal(
                            right: Radius.circular(10))
                        : const BorderRadius.horizontal(
                            left: Radius.circular(10)),
                    child: Image.asset(
                      shortlist[index]['image'].toString(),
                      width: size.width * 0.27,
                      height: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  widthSpace,
                  width5Space,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shortlist[index]['title'].toString(),
                          style: semibold16black2,
                        ),
                        height5Space,
                        Text(
                          "${shortlist[index]['result']} ${getTranslate(context, 'vendor_shortlist.result')}",
                          style: medium14Grey94,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: shortlist.length,
    );
  }

  addListview(Size size) {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/venues');
          },
          child: Container(
            height: size.height * 0.13,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
                vertical: fixPadding, horizontal: fixPadding * 2),
            child: DottedBorder(
              color: blackColor,
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              dashPattern: const [3, 3],
              child: SizedBox(
                height: size.height * 0.13,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    widthSpace,
                    width5Space,
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addshortList[index],
                            style: semibold16black2,
                          ),
                          height5Space,
                          Text(
                            getTranslate(
                                context, 'vendor_shortlist.add_shortlist'),
                            style: medium13Grey94,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: addshortList.length,
    );
  }
}
