import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController eventdateController = TextEditingController();
  TextEditingController brideNameController = TextEditingController();
  TextEditingController groomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        title: Text(getTranslate(context, 'task.task')),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: fixPadding,
          left: fixPadding * 2,
          right: fixPadding * 2,
          bottom: fixPadding * 2,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          imageContainer(size),
          heightSpace,
          height5Space,
          Text(
            getTranslate(context, 'task.plan_wedding'),
            style: semibold20Primary,
          ),
          heightSpace,
          heightSpace,
          planlistWidget(size, Icons.assignment_outlined,
              getTranslate(context, 'task.to_do_list'), "05/10", () {
            Navigator.pushNamed(context, '/todoList');
          }),
          heightSpace,
          heightSpace,
          planlistWidget(size, LineAwesomeIcons.user_tie,
              getTranslate(context, 'task.guestlist'), "05/10", () {
            Navigator.pushNamed(context, '/guestList');
          }),
          heightSpace,
          heightSpace,
          planlistWidget(size, Icons.favorite_border,
              getTranslate(context, 'task.vendor_shortlist'), "02/10", () {
            Navigator.pushNamed(context, '/vendorshortList');
          }),
          heightSpace,
          heightSpace,
          planlistWidget(size, LineAwesomeIcons.money_bill,
              getTranslate(context, 'task.budget'), "\$5400", () {
            Navigator.pushNamed(context, '/budget');
          }),
        ],
      ),
    );
  }

  planlistWidget(
      Size size, IconData icon, String title, String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: fixPadding),
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
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 22,
            ),
            widthSpace,
            Expanded(
              child: Text(
                title,
                style: semibold16black2,
              ),
            ),
            Text(
              text,
              style: semibold16Grey,
            )
          ],
        ),
      ),
    );
  }

  imageContainer(Size size) {
    return Container(
      height: size.height * 0.33,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(
            "assets/task/Rectangle 230.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(fixPadding / 1.5),
        decoration: BoxDecoration(
          color: blackColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    editPlaningSheet(size);
                  },
                  child: const Icon(
                    LineAwesomeIcons.edit_1,
                    color: whiteColor,
                  ),
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/task/bx_happy-heart-eyes.png",
                      height: size.height * 0.045,
                      width: size.height * 0.045,
                    ),
                    heightSpace,
                    const Text(
                      "Arunima & Anurag",
                      style: semibold20White,
                    ),
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        timewidget(
                            size, "56", getTranslate(context, 'task.days')),
                        widthSpace,
                        width5Space,
                        timewidget(
                            size, "24", getTranslate(context, 'task.hrs')),
                        widthSpace,
                        width5Space,
                        timewidget(
                            size, "52", getTranslate(context, 'task.mins')),
                        width5Space,
                        widthSpace,
                        timewidget(
                            size, "10", getTranslate(context, 'task.secs')),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  timewidget(Size size, String text1, String text2) {
    return Container(
      height: size.height * 0.075,
      width: size.height * 0.07,
      padding: const EdgeInsets.all(fixPadding / 3),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              text1,
              style: semibold13Primary,
            ),
          ),
          FittedBox(
            child: Text(
              text2,
              style: semibold13Primary,
            ),
          )
        ],
      ),
    );
  }

  editPlaningSheet(Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(fixPadding * 2),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      barrierColor: blackColor.withOpacity(0.2),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10))),
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
                                getTranslate(context, 'task.upload_image'),
                                style: semibold18black2,
                              ),
                              heightSpace,
                              heightSpace,
                              height5Space,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  bottonsheetIcon(
                                      size,
                                      Icons.camera_alt_rounded,
                                      const Color(0xff1E4799),
                                      getTranslate(context, 'task.camera')),
                                  bottonsheetIcon(
                                      size,
                                      Icons.photo,
                                      const Color(0xff1E996D),
                                      getTranslate(context, 'task.gallery')),
                                  bottonsheetIcon(
                                      size,
                                      CupertinoIcons.trash_fill,
                                      const Color(0xffEF1717),
                                      getTranslate(context, 'task.remove')),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Center(
                    child: Container(
                      height: size.height * 0.1,
                      width: size.height * 0.1,
                      decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: blackColor2,
                      ),
                    ),
                  ),
                ),
                heightSpace,
                Center(
                  child: Text(
                    getTranslate(context, 'task.upload_image'),
                    style: semibold15Black2,
                    textAlign: TextAlign.center,
                  ),
                ),
                heightSpace,
                heightSpace,
                eventdateField(context),
                heightSpace,
                heightSpace,
                bridenameField(context),
                heightSpace,
                heightSpace,
                groomeNameField(context),
                heightSpace,
                heightSpace,
                heightSpace,
                saveButton(context, size),
                heightSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  saveButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        eventdateController.clear();
        brideNameController.clear();
        groomNameController.clear();
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
          getTranslate(context, 'task.save'),
          style: bold18White,
        ),
      ),
    );
  }

  groomeNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'task.groome_name'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
              controller: groomNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'task.groome_name'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bridenameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'task.bride_name'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
              controller: brideNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'task.bride_name'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        ),
      ],
    );
  }

  eventdateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'task.event_date'),
          style: semibold15Black2,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
              onTap: () async {
                final pikedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme:
                                const ColorScheme.light(primary: primaryColor)),
                        child: child!);
                  },
                );
                if (pikedDate != null) {
                  setState(() {
                    String formmatedDate = DateFormat('dd  MMMM  yyyy',
                            Localizations.localeOf(context).toString())
                        .format(pikedDate);
                    eventdateController.text = formmatedDate;
                  });
                }
              },
              readOnly: true,
              controller: eventdateController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(context, 'task.event_date'),
                hintStyle: medium15Grey94,
                suffixIconConstraints: const BoxConstraints(minWidth: 0),
                suffixIcon: const Icon(
                  Icons.date_range_outlined,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bottonsheetIcon(Size size, IconData icon, Color color, String text) {
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
