import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuestListScreen extends StatefulWidget {
  const GuestListScreen({Key? key}) : super(key: key);

  @override
  State<GuestListScreen> createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  TextEditingController addguestController = TextEditingController();

  final guestList = [
    {
      "name": "Jane Cooper",
      "isinvite": true,
    },
    {
      "name": "Esther Howard",
      "isinvite": true,
    },
    {
      "name": "Guy Hawkins",
      "isinvite": true,
    },
    {
      "name": "Robert Fox",
      "isinvite": true,
    },
    {
      "name": "Jacob Jones",
      "isinvite": true,
    },
    {
      "name": "Cody Fisher",
      "isinvite": false,
    },
    {
      "name": "Annette Black",
      "isinvite": false,
    },
    {
      "name": "Devon Lane",
      "isinvite": false,
    },
    {
      "name": "Theresa Webb",
      "isinvite": false,
    },
    {
      "name": "Jane Cooper",
      "isinvite": false,
    },
    {
      "name": "Eleanor Pena",
      "isinvite": false,
    },
    {
      "name": "Jerome Bell",
      "isinvite": false,
    },
    {
      "name": "Albert Flores",
      "isinvite": false,
    },
    {
      "name": "Bessie Cooper",
      "isinvite": false,
    },
    {
      "name": "Ralph Edwards",
      "isinvite": false,
    },
    {
      "name": "Ralph Edwards",
      "isinvite": false,
    },
    {
      "name": "Annette Black",
      "isinvite": false,
    },
    {
      "name": "Marvin McKinney",
      "isinvite": false,
    },
    {
      "name": "Savannah Nguyen",
      "isinvite": false,
    },
    {
      "name": "Darlene Robertson",
      "isinvite": false,
    },
    {
      "name": "Courtney Henry",
      "isinvite": false,
    },
    {
      "name": "Marvin McKinney",
      "isinvite": false,
    },
  ];

  bool? isInvite;

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
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(getTranslate(context, 'guest_list.guest_list')),
      ),
      body: gusetlist(size),
      bottomNavigationBar: bottomaddButton(context, size),
    );
  }

  gusetlist(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: fixPadding * 2,
        right: fixPadding * 2,
        bottom: fixPadding * 2,
      ),
      itemCount: guestList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              onTap: () {
                setState(() {
                  isInvite = guestList[index]['isinvite'] as bool;
                  guestList[index]['isinvite'] = !isInvite!;
                });
              },
              leading: const Icon(
                CupertinoIcons.person,
                size: 17,
                color: blackColor2,
              ),
              minLeadingWidth: 0,
              title: Text(
                guestList[index]['name'].toString(),
                style: semibold14black2,
              ),
              trailing: guestList[index]['isinvite'] == true
                  ? Container(
                      height: size.height * 0.03,
                      width: size.height * 0.03,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.done,
                        color: whiteColor,
                        size: 20,
                      ),
                    )
                  : Container(
                      height: size.height * 0.03,
                      width: size.height * 0.03,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    ),
            ),
            guestList.length - 1 == index
                ? const SizedBox()
                : Container(
                    height: 1,
                    width: double.maxFinite,
                    color: const Color(0xffD9D9D9),
                  ),
          ],
        );
      },
    );
  }

  bottomaddButton(BuildContext context, Size size) {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(fixPadding * 2),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Text(
                        getTranslate(context, 'guest_list.add_guest'),
                        style: semibold18black2,
                        textAlign: TextAlign.center,
                      ),
                      heightSpace,
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme:
                              const ColorScheme.light(primary: primaryColor),
                        ),
                        child: TextField(
                          controller: addguestController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            hintText: getTranslate(
                                context, 'guest_list.enter_guest_name'),
                            hintStyle: semibold14black2,
                            prefixIcon: const Icon(
                              CupertinoIcons.person,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      GestureDetector(
                        onTap: () {
                          if (addguestController.text.isNotEmpty) {
                            setState(() {
                              guestList.add({
                                "name": addguestController.text,
                                "isinvite": false,
                              });
                            });
                          }
                          guestList;
                          addguestController.clear();
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
                            getTranslate(context, 'guest_list.add'),
                            style: bold18White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          height: size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.25),
                blurRadius: 5,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle_outline,
                color: primaryColor,
                size: 22,
              ),
              widthSpace,
              widthSpace,
              Text(
                getTranslate(context, 'guest_list.add_guest'),
                style: semibold16Primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
