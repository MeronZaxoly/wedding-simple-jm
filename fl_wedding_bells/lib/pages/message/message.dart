import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  final userMessages = [
    {
      "image": "assets/messages/image1.png",
      "name": "Jacob Jones",
      "message": "Hello",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image2.png",
      "name": "Guy Hawkins",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image3.png",
      "name": "Leslie Alexander",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image4.png",
      "name": "Esther Howard",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image5.png",
      "name": "Wade Warren",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image6.png",
      "name": "Annette Black",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image7.png",
      "name": "Theresa Webb",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image8.png",
      "name": "Arlene McCoy",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image9.png",
      "name": "Darrell Steward",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image10.png",
      "name": "Devon Lane",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image11.png",
      "name": "Dianne Russell",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image12.png",
      "name": "Theresa Webb",
      "message": "hello, thank you",
      "time": "2.00am"
    },
    {
      "image": "assets/messages/image13.png",
      "name": "Devon Lane",
      "message": "hello, thank you",
      "time": "2.00am"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: whiteColor,
        foregroundColor: blackColor2,
        elevation: 0,
        title: Text(
          getTranslate(context, 'message.message'),
        ),
      ),
      body: Column(
        children: [
          height5Space,
          searchfield(context),
          messageListview(size),
        ],
      ),
    );
  }

  messageListview(Size size) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: userMessages.length,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2, vertical: fixPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/chat');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: fixPadding),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.07,
                    width: size.height * 0.07,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          userMessages[index]['image'].toString(),
                        ),
                      ),
                    ),
                  ),
                  widthSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userMessages[index]['name'].toString(),
                          style: medium16Black2,
                        ),
                        height5Space,
                        Text(
                          userMessages[index]['message'].toString(),
                          style: medium14Grey94,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userMessages[index]['time'].toString(),
                        style: regular14Grey94,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  searchfield(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
          controller: searchController,
          keyboardType: TextInputType.text,
          style: const TextStyle(height: 1.5),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            hintText: getTranslate(context, 'message.search'),
            hintStyle: semibold16Grey,
          ),
        ),
      ),
    );
  }
}
