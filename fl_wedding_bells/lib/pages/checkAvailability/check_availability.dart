import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:fl_wedding_bells/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckAvailability extends StatefulWidget {
  const CheckAvailability({Key? key}) : super(key: key);

  @override
  State<CheckAvailability> createState() => _CheckAvailabilityState();
}

class _CheckAvailabilityState extends State<CheckAvailability> {
  TextEditingController eventDateController = TextEditingController();
  TextEditingController functionController = TextEditingController();
  TextEditingController noOfguestController = TextEditingController();

  final functions = [
    translate('check_availablility.ring_ceremony'),
    translate('check_availablility.marriage'),
    translate('check_availablility.birthday_celebration'),
    translate('check_availablility.reception')
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        foregroundColor: blackColor2,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
            getTranslate(context, 'check_availablility.check_availability')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2),
        children: [
          Text(
            getTranslate(context, 'check_availablility.availability_text'),
            style: semibold20Black2,
            textAlign: TextAlign.center,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          eventDateField(context),
          heightSpace,
          heightSpace,
          functionField(context),
          heightSpace,
          heightSpace,
          gusetField(context),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          checkAvailability(size),
        ],
      ),
    );
  }

  checkAvailability(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/venueAvailable');
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
          getTranslate(context, 'check_availablility.check_availability'),
          style: bold18White,
        ),
      ),
    );
  }

  gusetField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'check_availablility.number_guest'),
          style: semibold15Black2,
        ),
        height5Space,
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
              controller: noOfguestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: getTranslate(
                    context, 'check_availablility.hint_number_guest'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        ),
      ],
    );
  }

  functionField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'check_availablility.function_type'),
          style: semibold15Black2,
        ),
        height5Space,
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
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          heightSpace,
                          heightSpace,
                          Text(
                            getTranslate(
                                context, 'check_availablility.function_type'),
                            style: semibold16Black,
                          ),
                          heightSpace,
                          ColumnBuilder(
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        functionController.text =
                                            functions[index];
                                      });
                                      Navigator.pop(context);
                                    },
                                    title: Text(
                                      functions[index],
                                      style: medium15Black2,
                                    ),
                                  ),
                                  functions.length - 1 == index
                                      ? const SizedBox()
                                      : Container(
                                          height: 1,
                                          color: const Color(0xffD4D4D4),
                                          width: double.infinity,
                                        )
                                ],
                              );
                            },
                            itemCount: functions.length,
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              controller: functionController,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    getTranslate(context, 'check_availablility.function_type'),
                hintStyle: medium15Grey94,
              ),
            ),
          ),
        ),
      ],
    );
  }

  eventDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'check_availablility.event_date'),
          style: semibold15Black2,
        ),
        height5Space,
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
                    String formmatedDate = DateFormat(
                      'dd  MMMM  yyyy',
                      Localizations.localeOf(context).toString(),
                    ).format(pikedDate);
                    eventDateController.text = formmatedDate;
                  });
                }
              },
              controller: eventDateController,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    getTranslate(context, 'check_availablility.event_date'),
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
}
