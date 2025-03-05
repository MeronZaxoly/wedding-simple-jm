import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/auth/login (1).png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            backButton(context),
            heightBox(size.height * 0.020),
            register(context),
            height5Space,
            registerText(context),
            heightSpace,
            heightSpace,
            heightSpace,
            nameField(context),
            heightSpace,
            heightSpace,
            mobileField(context),
            heightSpace,
            heightSpace,
            emailField(context),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            registerButton(size, context),
          ],
        ),
      ),
    );
  }

  backButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(fixPadding * 2),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ],
    );
  }

  registerButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/otp');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
          getTranslate(context, 'register.register'),
          style: bold18White,
        ),
      ),
    );
  }

  nameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'register.name'),
            style: semibold14black2,
          ),
          height5Space,
          height5Space,
          Container(
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
                  colorScheme: const ColorScheme.light(primary: primaryColor)),
              child: TextField(
                style: const TextStyle(height: 1.3),
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: getTranslate(context, 'register.enter_name'),
                  hintStyle: medium15Grey94,
                  prefixIcon: const Icon(
                    CupertinoIcons.person,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  mobileField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'register.mobile_number'),
            style: semibold14black2,
          ),
          height5Space,
          height5Space,
          Container(
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
                  colorScheme: const ColorScheme.light(primary: primaryColor)),
              child: TextField(
                style: const TextStyle(height: 1.3),
                keyboardType: TextInputType.phone,
                controller: mobileController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: getTranslate(context, 'register.enter_number'),
                  hintStyle: medium15Grey94,
                  prefixIcon: const Icon(
                    CupertinoIcons.phone,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  emailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'register.email_address'),
            style: semibold14black2,
          ),
          height5Space,
          height5Space,
          Container(
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
                  colorScheme: const ColorScheme.light(primary: primaryColor)),
              child: TextField(
                style: const TextStyle(height: 1.3),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: getTranslate(context, 'register.enter_email'),
                  hintStyle: medium15Grey94,
                  prefixIcon: const Icon(
                    CupertinoIcons.mail,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  registerText(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'register.create_account'),
        style: semibold14Grey94,
      ),
    );
  }

  register(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'register.register'),
        style: bold20Primary,
      ),
    );
  }
}
