import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notifications = [
    {
      "title": "Venue Booking",
      "desc": "Your venue Blue Sea Banquets booking successfully.",
    },
    {
      "title": "Makup artist",
      "desc": "Your bridal makup booking is confirm at 22 jan 2022",
    },
    {
      "title": "Photographers",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi",
    },
    {
      "title": "Mahendi artist",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi",
    },
    {
      "title": "Caterers",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi",
    },
    {
      "title": "Budget plan",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        foregroundColor: blackColor2,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'notification.notification'),
        ),
      ),
      body: notifications.isEmpty
          ? emptyNotificationText(size)
          : notificationListview(context, size),
    );
  }

  emptyNotificationText(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/notifications/notification 1.png",
            height: size.height * 0.07,
            width: size.height * 0.07,
          ),
          heightSpace,
          heightSpace,
          Text(
            getTranslate(context, 'notification.no_notification'),
            style: medium16Grey94,
          ),
        ],
      ),
    );
  }

  notificationListview(BuildContext context, Size size) {
    return ListView.builder(
      itemCount: notifications.length,
      padding: const EdgeInsets.only(bottom: fixPadding),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (contetx, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
          ),
          onDismissed: (direction) {
            setState(() {
              notifications.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: blackColor,
                content: Text(
                  getTranslate(context, 'notification.remove_notification'),
                  style: const TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(milliseconds: 1500),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2, vertical: fixPadding),
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 1.5, vertical: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: grey94Color.withOpacity(0.5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.06,
                  width: size.height * 0.06,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF9EAE9),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    CupertinoIcons.bell,
                    size: 22,
                    color: primaryColor,
                  ),
                ),
                widthSpace,
                width5Space,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifications[index]['title'].toString(),
                        style: semibold16black2,
                      ),
                      heightBox(3),
                      Text(
                        notifications[index]['desc'].toString(),
                        style: medium13black2,
                      ),
                      heightBox(3),
                      Text(
                        "2 min ${getTranslate(context, 'notification.ago')}",
                        style: medium13Grey94,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
