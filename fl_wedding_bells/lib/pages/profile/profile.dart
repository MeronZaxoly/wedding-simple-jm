import 'package:dotted_border/dotted_border.dart';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(getTranslate(context, 'profile.profile')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: fixPadding, bottom: fixPadding * 2),
        children: [
          Stack(
            children: [
              profileDetailContainer(size, context),
              userProfileImage(size),
            ],
          )
        ],
      ),
    );
  }

  userProfileImage(Size size) {
    return Center(
      child: Container(
        height: size.height * 0.14,
        width: size.height * 0.14,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/profile/Ellipse 67.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  profileDetailContainer(Size size, context) {
    return Column(
      children: [
        SizedBox(height: size.height * 0.07),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: fixPadding,
            horizontal: fixPadding * 2,
          ),
          width: size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2,
          ),
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
              heightBox(size.height * 0.07),
              const Text(
                "Leslie Alexander",
                style: semibold16black2,
              ),
              height5Space,
              const Text(
                "+91(9876543210)",
                style: medium14Grey94,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              listTileWidget(
                CupertinoIcons.person,
                getTranslate(context, 'profile.edit_profile'),
                () {
                  Navigator.pushNamed(context, '/editProfile');
                },
              ),
              divider(),
              listTileImageWidget(
                "assets/profile/fluent_ticket-diagonal-24-regular.png",
                getTranslate(context, 'profile.booking'),
                () {
                  Navigator.pushNamed(context, '/booking');
                },
              ),
              divider(),
              listTileImageWidget(
                "assets/profile/carbon_chart-ring.png",
                getTranslate(context, 'profile.budget'),
                () {
                  Navigator.pushNamed(context, '/budget');
                },
              ),
              divider(),
              listTileWidget(
                CupertinoIcons.globe,
                getTranslate(context, 'profile.language'),
                () {
                  Navigator.pushNamed(context, '/languages');
                },
              ),
              divider(),
              listTileWidget(
                Icons.info_outline,
                getTranslate(context, 'profile.about_us'),
                () {
                  Navigator.pushNamed(context, '/aboutUs');
                },
              ),
              divider(),
              listTileWidget(
                CupertinoIcons.question_diamond,
                getTranslate(context, 'profile.faqs'),
                () {
                  Navigator.pushNamed(context, '/faqs');
                },
              ),
              divider(),
              listTileWidget(
                Icons.assignment_outlined,
                getTranslate(context, 'profile.privacy_policy'),
                () {
                  Navigator.pushNamed(context, '/privacyPolicy');
                },
              ),
              divider(),
              listTileWidget(
                Icons.support_agent,
                getTranslate(context, 'profile.customer_support'),
                () {
                  Navigator.pushNamed(context, '/customerSupport');
                },
              ),
              divider(),
              listTileWidget(
                LineAwesomeIcons.alternate_sign_out,
                getTranslate(context, 'profile.logout'),
                () {
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
                              "assets/profile/logoutlogo.png",
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                            ),
                            heightSpace,
                            heightSpace,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: fixPadding * 2),
                              child: Text(
                                getTranslate(context, 'profile.logout_text'),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      getTranslate(context, 'profile.no'),
                                      style: semibold16Black,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: Text(
                                      getTranslate(context, 'profile.logout'),
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
                color: primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  divider() {
    return Container(
      height: 1,
      color: const Color(0xffD9D9d9),
      width: double.maxFinite,
    );
  }

  listTileWidget(IconData icon, String text, Function() onTap,
      {Color color = blackColor}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        size: 20,
        color: color,
      ),
      minLeadingWidth: 0,
      title: Text(
        text,
        style: semibold16black2.copyWith(color: color),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: color,
        size: 17,
      ),
    );
  }

  listTileImageWidget(
    String icon,
    String text,
    Function() onTap,
  ) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        icon,
        height: 20,
        width: 20,
        color: blackColor2,
        fit: BoxFit.cover,
      ),
      minLeadingWidth: 0,
      title: Text(
        text,
        style: semibold16black2,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: blackColor2,
        size: 17,
      ),
    );
  }
}
