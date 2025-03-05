import 'package:dotted_border/dotted_border.dart';
import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/pages/profile/languages.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final todolist = [
    {"name": "Determine and manage budget", "isdone": true},
    {"name": "Decide a wedding theam", "isdone": true},
    {"name": "Search & shortlist venue", "isdone": false},
    {"name": "Checkout caterers availabale", "isdone": false},
    {"name": "Create guest list & invite", "isdone": false},
    {"name": "Search & shortlist makup artist", "isdone": false},
    {"name": "Search & shortlist photographers", "isdone": false},
    {"name": "Search & shortlist bridecloth", "isdone": false},
    {"name": "Search & shortlist groome cloth", "isdone": false},
    {"name": "Search & shortlist  Bridal jewellery", "isdone": false},
    {"name": "Search & shortlist mahendi artist", "isdone": false},
    {"name": "Search & book music dj", "isdone": false},
    {"name": "Search & shortlist groome jewellery", "isdone": false},
    {"name": "Search & shortlist photographers", "isdone": false}
  ];

  bool? isDone;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          getTranslate(context, 'todo_list.todo_list'),
        ),
      ),
      body: Column(
        children: [
          imageTextContainer(size),
          todolistview(size),
        ],
      ),
    );
  }

  todolistview(Size size) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: fixPadding, bottom: fixPadding * 2),
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          isDone = todolist[index]['isdone'] as bool;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding),
            child: ListTile(
              onTap: () {
                setState(() {
                  isDone = todolist[index]['isdone'] as bool;
                  todolist[index]['isdone'] = !isDone!;
                });
              },
              leading: todolist[index]['isdone'] == true
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
              minLeadingWidth: 0,
              title: Text(
                todolist[index]['name'].toString(),
                style: todolist[index]['isdone'] == true
                    ? medium16Black2.copyWith(
                        decoration: TextDecoration.lineThrough)
                    : medium16Black2,
              ),
            ),
          );
        },
      ),
    );
  }

  imageTextContainer(Size size) {
    return Container(
      height: size.height * 0.14,
      margin: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
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
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/todoList/todoImage.png",
                  height: size.height * 0.14,
                  width: size.height * 0.14,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          widthSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.06,
                  width: size.height * 0.06,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: grey94Color.withOpacity(0.5),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "6%",
                    style: semibold16Primary,
                  ),
                ),
                height5Space,
                Text(
                  getTranslate(context, 'todo_list.task_done'),
                  style: semibold14Primary,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: fixPadding / 1.5),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: selectedLanguagesIndex == 4
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                          )
                        : const BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "54 ${getTranslate(context, 'todo_list.day_left')}",
                    style: semibold14White,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      DottedBorder(
                        padding: EdgeInsets.zero,
                        dashPattern: const [3, 3],
                        color: grey94Color,
                        child: Container(
                          height: double.maxFinite,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "4",
                              style: semibold14Primary,
                            ),
                            Text(
                              getTranslate(context, 'todo_list.done'),
                              style: semibold14Grey94,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "25",
                              style: semibold14Primary,
                            ),
                            Text(
                              getTranslate(context, 'todo_list.to_do'),
                              style: semibold14Grey94,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
