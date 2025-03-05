import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(getTranslate(context, 'about_us.about_us')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: fixPadding,
          bottom: fixPadding * 2,
          left: fixPadding * 2,
          right: fixPadding * 2,
        ),
        children: [
          text1(),
          heightSpace,
          height5Space,
          text1(),
          heightSpace,
          height5Space,
          text2(),
          heightSpace,
          height5Space,
          text2(),
          heightSpace,
          height5Space,
          text2(),
        ],
      ),
    );
  }

  text2() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscings elit. Lacus, sit risus mauris amet cursus doPenatibus velit curabitur viverra tortor diam augue purus.Fusce tellus turpis sit faucibus porttitor ornarpellentesquef adipiscing. Fermentum et praesent enim venenatis. Morbi sit accumsan tortor viverra pretium eget ests faucibus nec. Magna interdum nec ornare nullamkjl velit aliquet sed viverra sed. Non eget velit at nullasd Lorem ipsum dolor sit amet, consectetur adipiscings elit. Lacus, sit risus mauris amet cursus doPenatibus velit curabitur viverra tortor diam augue purus.Fusce tellus turpis sit faucibus porttitor ornarpellentesquef adipiscing. Fermentum et praesent enim venenatis. Morbi sit accumsan tortor viverra pretium eget ests faucibus nec. Magna interdum nec ornare nullamkjl velit aliquet sed viverra sed. Non eget velit at nulla.",
      style: medium14Grey94,
    );
  }

  text1() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscings elit. Lacus, sit risus mauris amet cursus doPenatibus velit curabitur viverra tortor diam augue purus.Fusce tellus turpis sit faucibus porttitor ornarpellentesquef adipiscing. Fermentum et praesent enim venenatis. Morbi sit accumsan tortor viverra pretium eget ests faucibus nec. Magna interdum nec ornare nullamkjl velit aliquet sed viverra sed. Non eget velit at nulla.",
      style: medium14Grey94,
    );
  }
}
