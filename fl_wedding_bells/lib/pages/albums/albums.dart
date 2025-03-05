import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';

class AlbumsScreen extends StatelessWidget {
  AlbumsScreen({Key? key}) : super(key: key);

  final albums = [
    {
      "image": "assets/albums/album1.png",
      "name": "Main hall",
      "noOfImage": 150,
    },
    {
      "image": "assets/albums/album2.png",
      "name": "Dining area",
      "noOfImage": 20,
    },
    {
      "image": "assets/albums/album3.png",
      "name": "Garden",
      "noOfImage": 30,
    },
    {
      "image": "assets/albums/album4.png",
      "name": "Dj party",
      "noOfImage": 10,
    },
    {
      "image": "assets/albums/album5.png",
      "name": "Haldi ceremony",
      "noOfImage": 100,
    },
    {
      "image": "assets/albums/album6.png",
      "name": "Conference hall",
      "noOfImage": 20,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
        foregroundColor: blackColor2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(getTranslate(context, 'albums.albums')),
      ),
      body: GridView.builder(
        itemCount: albums.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          bottom: fixPadding * 2,
          top: fixPadding,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: fixPadding * 2,
          mainAxisSpacing: fixPadding * 2,
          childAspectRatio: size.width / (size.height / 1.6),
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/diningArea');
            },
            child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.asset(
                        albums[index]['image'].toString(),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(albums[index]['name'].toString(),
                            style: semibold13black2,
                            overflow: TextOverflow.ellipsis),
                        height5Space,
                        Text(
                            "${albums[index]['noOfImage']} ${getTranslate(context, 'albums.image')}",
                            style: semibold13Grey,
                            overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
