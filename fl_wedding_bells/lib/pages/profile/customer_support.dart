import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          topImageContainer(size, context),
          fieldList(context, size),
        ],
      ),
    );
  }

  fieldList(BuildContext context, Size size) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(fixPadding * 2),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            getTranslate(context, 'customer_support.write_us'),
            style: semibold20Black2,
          ),
          Text(
            getTranslate(context, 'customer_support.text'),
            style: semibold14Grey94,
          ),
          heightSpace,
          heightSpace,
          nameField(context),
          heightSpace,
          heightSpace,
          emailField(context),
          heightSpace,
          heightSpace,
          messageField(size, context),
          heightBox(size.height * 0.06),
          sendButton(context, size),
        ],
      ),
    );
  }

  sendButton(BuildContext context, Size size) {
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
          getTranslate(context, 'customer_support.send'),
          style: bold18White,
        ),
      ),
    );
  }

  messageField(Size size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'customer_support.message'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          height: size.height * 0.17,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          width: double.infinity,
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
              controller: messageController,
              keyboardType: TextInputType.text,
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    getTranslate(context, 'customer_support.write_message'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        )
      ],
    );
  }

  emailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'customer_support.email_address'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          width: double.infinity,
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'customer_support.enter_email'),
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
          getTranslate(context, 'customer_support.name'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          width: double.infinity,
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
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'customer_support.enter_name'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        )
      ],
    );
  }

  topImageContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.31,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/profile/Rectangle 412.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.all(fixPadding * 2),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(fixPadding * 2),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: fixPadding * 1.3, horizontal: fixPadding * 2),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.phone,
                          size: 20,
                          color: primaryColor,
                        ),
                        widthSpace,
                        Expanded(
                          child: Center(
                            child: Text(
                              getTranslate(context, 'customer_support.call_us'),
                              style: semibold16Primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                widthSpace,
                widthSpace,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: fixPadding * 1.3,
                      horizontal: fixPadding * 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.mail,
                          size: 20,
                          color: primaryColor,
                        ),
                        widthSpace,
                        Expanded(
                          child: Center(
                            child: Text(
                              getTranslate(context, 'customer_support.mail_us'),
                              style: semibold16Primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
