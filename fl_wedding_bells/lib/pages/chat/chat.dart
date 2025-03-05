import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/pages/profile/languages.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();

  final messages = [
    {
      "isMe": true,
      "message": "Hello I want book this hall",
    },
    {
      "isMe": false,
      "message":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis sed sodales purus ",
    },
    {
      "isMe": true,
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    },
    {
      "isMe": false,
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    },
    {
      "isMe": true,
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    },
    {
      "isMe": false,
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'chat.name')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/calling');
            },
            icon: const Icon(
              CupertinoIcons.phone,
              size: 21,
              color: blackColor2,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          messagesListview(),
          sendField(size, context),
        ],
      ),
    );
  }

  messagesListview() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2, vertical: fixPadding),
        physics: const BouncingScrollPhysics(),
        itemCount: messages.length,
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          int reverseindex = messages.length - index - 1;
          return Align(
            alignment: selectedLanguagesIndex == 4
                ? (messages[reverseindex]['isMe'] == true
                    ? Alignment.centerLeft
                    : Alignment.centerRight)
                : (messages[reverseindex]['isMe'] == true
                    ? Alignment.centerRight
                    : Alignment.centerLeft),
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              margin: selectedLanguagesIndex == 4
                  ? messages[reverseindex]['isMe'] == true
                      ? const EdgeInsets.only(
                          top: fixPadding,
                          bottom: fixPadding,
                          right: 70,
                        )
                      : const EdgeInsets.only(
                          top: fixPadding,
                          bottom: fixPadding,
                          left: 70,
                        )
                  : messages[reverseindex]['isMe'] == true
                      ? const EdgeInsets.only(
                          top: fixPadding,
                          bottom: fixPadding,
                          left: 70,
                        )
                      : const EdgeInsets.only(
                          top: fixPadding,
                          bottom: fixPadding,
                          right: 70,
                        ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
                border: Border.all(
                    color: messages[reverseindex]['isMe'] == true
                        ? primaryColor
                        : Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: grey94Color.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Text(
                messages[reverseindex]['message'].toString(),
                style: messages[reverseindex]['isMe'] == true
                    ? semibold14Primary
                    : semibold14black2,
              ),
            ),
          );
        },
      ),
    );
  }

  sendField(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: fixPadding * 2, right: fixPadding * 2, bottom: fixPadding),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primaryColor),
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
                  controller: textController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.sentiment_satisfied_outlined,
                      color: primaryColor,
                    ),
                    hintText: getTranslate(context, 'chat.type_here'),
                    hintStyle: medium14Primary,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.rotate(
                          angle: 0.8,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: fixPadding / 2),
                            child: Icon(
                              Icons.attach_file,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: fixPadding / 2),
                          child: Icon(
                            Icons.mic_none,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          widthSpace,
          GestureDetector(
            onTap: () {
              setState(() {
                if (textController.text.isEmpty) {
                  null;
                } else {
                  messages.add({
                    "isMe": true,
                    "message": textController.text,
                  });
                }
              });
              messages;
              textController.clear();
            },
            child: Container(
              height: size.height * 0.07,
              width: size.height * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryColor),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: grey94Color.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.send, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
