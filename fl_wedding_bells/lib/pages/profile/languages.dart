import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/main.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/column_builder.dart';

int? selectedLanguagesIndex;

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  SharedPreferences? prefs;
  String keys = 'value';

  @override
  void initState() {
    read();
    super.initState();
  }

  read() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguagesIndex = prefs?.getInt(keys) ?? 0;
    });
  }

  void changeLanguages(String languageCode) async {
    Locale temp = await setLocale(languageCode);

    // ignore: use_build_context_synchronously
    MyApp.setLocale(context, temp);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(getTranslate(context, 'language.language')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
        children: [
          titleText(),
          heightSpace,
          languagesList(size),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          updateButton(context, size),
        ],
      ),
    );
  }

  languagesList(Size size) {
    return ColumnBuilder(
      itemCount: LanguagesList.languageList.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: fixPadding),
          alignment: Alignment.center,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              setState(() {
                selectedLanguagesIndex = index;
              });
              prefs?.setInt(keys, selectedLanguagesIndex!);
            },
            leading: Container(
              height: size.height * 0.029,
              width: size.height * 0.029,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: grey94Color.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ],
                border: selectedLanguagesIndex == index
                    ? Border.all(
                        color: primaryColor,
                        width: 6,
                      )
                    : Border.all(color: whiteColor),
              ),
            ),
            minLeadingWidth: 0,
            title: Text(
              LanguagesList.languageList[index].name.toString(),
              style: medium16Black2,
            ),
          ),
        );
      },
    );
  }

  titleText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      child: Text(
        getTranslate(context, 'language.select_language'),
        style: semibold14black2,
      ),
    );
  }

  updateButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedLanguagesIndex == 0) {
            changeLanguages(LanguagesList.languageList[0].languageCode!);
          } else if (selectedLanguagesIndex == 1) {
            changeLanguages(LanguagesList.languageList[1].languageCode!);
          } else if (selectedLanguagesIndex == 2) {
            changeLanguages(LanguagesList.languageList[2].languageCode!);
          } else if (selectedLanguagesIndex == 3) {
            changeLanguages(LanguagesList.languageList[3].languageCode!);
          } else if (selectedLanguagesIndex == 4) {
            changeLanguages(LanguagesList.languageList[4].languageCode!);
          }
        });
        Navigator.pop(context);
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.25),
              ),
            ]),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'language.update'),
          style: bold18White,
        ),
      ),
    );
  }
}

class LanguagesList {
  final int? id;
  final String? name;
  final String? languageCode;

  LanguagesList({this.id, this.languageCode, this.name});

  static List<LanguagesList> languageList = [
    LanguagesList(id: 1, name: "English", languageCode: 'en'),
    LanguagesList(id: 2, name: "हिन्दी", languageCode: 'hi'),
    LanguagesList(id: 3, name: "Indonesia", languageCode: 'id'),
    LanguagesList(id: 4, name: "中国人", languageCode: 'zh'),
    LanguagesList(id: 5, name: "عربي", languageCode: 'ar'),
  ];
}
