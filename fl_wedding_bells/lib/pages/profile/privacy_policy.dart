import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(getTranslate(context, 'privacy_policy.privacy_policy')),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: fixPadding,
          bottom: fixPadding * 2,
          left: fixPadding * 2,
          right: fixPadding * 2,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          termsOfUseText(context),
          heightSpace,
          height5Space,
          privacyPolicy(context),
        ],
      ),
    );
  }

  privacyPolicy(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'privacy_policy.privacy_policy'),
          style: semibold16black2,
        ),
        heightSpace,
        text1(),
        heightSpace,
        text1(),
        heightSpace,
        text2(),
      ],
    );
  }

  termsOfUseText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'privacy_policy.terms_use'),
          style: semibold16black2,
        ),
        heightSpace,
        text1()
      ],
    );
  }

  text1() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscings elit. Lacus, sit risus mauris amet cursus doPenatibus velit curabitur viverra tortor diam augue purus.Fusce tellus turpis sit faucibus porttitor ornarpellentesquef adipiscing. Fermentum et praesent enim venenatis. Morbi sit accumsan tortor viverra pretium eget ests faucibus nec. Magna interdum nec ornare nullamkjl velit aliquet sed viverra sed. Non eget velit at nullasd Lorem ipsum dolor sit amet, consectetur adipiscings elit. Lacus, sit risus mauris amet cursus doPenatibus velit curabitur viverra tortor diam augue purus.Fusce tellus turpis sit faucibus porttitor ornarpellentesquef adipiscing. Fermentum et praesent enim venenatis. Morbi sit accumsan tortor viverra pretium eget ests faucibus nec. Magna interdum nec ornare nullamkjl velit aliquet sed viverra sed. Non eget velit at nulla.",
      style: medium14Grey94,
    );
  }

  text2() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscings elit. Lacus, sit risus mauris amet cursus doPenatibus velit curabitur viverra tortor diam augue purus.Fusce tellus turpis sit faucibus porttitor ornarpellentesquef adipiscing. Fermentum et praesent enim venenatis. Morbi sit accumsan tortor viverra pretium eget ests faucibus nec. Magna interdum nec ornare nullamkjl velit aliquet sed viverra sed. Non eget velit at nullasd Lorem ipsum dolor sit amet,",
      style: medium14Grey94,
    );
  }
}
