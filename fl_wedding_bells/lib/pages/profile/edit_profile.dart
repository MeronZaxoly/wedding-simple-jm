import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = "Leslie Alexander";
    numberController.text = "+91(9876543210)";
    emailController.text = "example@gmail.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'edit_profile.edit_profile')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2),
        physics: const BouncingScrollPhysics(),
        children: [
          userProfileImage(size, context),
          heightSpace,
          heightSpace,
          heightSpace,
          nameField(context),
          heightSpace,
          heightSpace,
          mobilenumberField(context),
          heightSpace,
          heightSpace,
          emailField(context),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          saveButton(context, size),
        ],
      ),
    );
  }

  saveButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25),
              blurRadius: 5,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'edit_profile.save'),
          style: bold18White,
        ),
      ),
    );
  }

  emailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'edit_profile.email_address'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'edit_profile.enter_email'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        )
      ],
    );
  }

  mobilenumberField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'edit_profile.mobile_number'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
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
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'edit_profile.enter_number'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        )
      ],
    );
  }

  nameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'edit_profile.name'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
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
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'edit_profile.enter_name'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        )
      ],
    );
  }

  userProfileImage(Size size, BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.height * 0.165,
        width: size.height * 0.16,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.16,
              width: size.height * 0.16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/profile/Ellipse 67.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    barrierColor: blackColor.withOpacity(0.2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    elevation: 4,
                    context: context,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(fixPadding * 2),
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              getTranslate(
                                  context, 'edit_profile.upload_image'),
                              style: semibold18black2,
                            ),
                            heightSpace,
                            heightSpace,
                            height5Space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                bottomsheetIcon(
                                    size,
                                    Icons.camera_alt_rounded,
                                    const Color(0xff1E4799),
                                    getTranslate(
                                        context, 'edit_profile.camera')),
                                bottomsheetIcon(
                                    size,
                                    Icons.photo,
                                    const Color(0xff1E996D),
                                    getTranslate(
                                        context, 'edit_profile.gallery')),
                                bottomsheetIcon(
                                    size,
                                    CupertinoIcons.trash_fill,
                                    const Color(0xffEF1717),
                                    getTranslate(
                                        context, 'edit_profile.remove')),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: size.height * 0.057,
                  width: size.height * 0.057,
                  decoration: BoxDecoration(
                    border: Border.all(color: whiteColor),
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    CupertinoIcons.camera,
                    color: whiteColor,
                    size: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomsheetIcon(Size size, IconData icon, Color color, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: grey94Color.withOpacity(0.3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          height5Space,
          Text(text.toString(),
              style: medium16Black2, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
