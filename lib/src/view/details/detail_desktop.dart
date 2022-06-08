import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../models/sleep_media_item.dart';
import '../../themes.dart';
import '../widgets/sleep_card_item.dart';
import 'detail_screen.dart';

Scaffold detailDesktopScreen({
  required BoxConstraints constraints,
  required BuildContext context,
  required double screenHeight,
  required double screenWidth,
  required Object tag,
  required bool isRelated,
  required SleepMediaItem sleepMediaItem,
}) {
  return Scaffold(
    backgroundColor: kPrimaryColor,
    body: Container(
      alignment: Alignment.center,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image_bg_welcome.png"),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Center(
            child: Container(
              width: screenWidth >= 1200 ? 1200 : screenWidth,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    color: Colors.black12,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: isRelated ? Null : tag,
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/image_placeholder.jpg",
                              width: screenWidth * 0.3,
                              fit: BoxFit.cover,
                              image: sleepMediaItem.imgUrl,
                              imageErrorBuilder: (c, o, s) => Image.asset(
                                "assets/image_placeholder.jpg",
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.45,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 16),
                                child: Text(
                                  "${sleepMediaItem.duration} | ${sleepMediaItem.category.name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: mediumTextStyle.copyWith(
                                    fontWeight: medium,
                                    letterSpacing: 1.2,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 10, 25),
                                child: Text(
                                  sleepMediaItem.title,
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Text(
                                  sleepMediaItem.description,
                                  style: TextStyle(
                                      fontWeight: light,
                                      height: 1.8,
                                      fontSize: 16,
                                      color: kprimaryTextColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 10, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(IconlyBold.heart,
                                            size: 18, color: kprimaryTextColor),
                                        const SizedBox(width: 10),
                                        FittedBox(
                                          child: Text(
                                            "${sleepMediaItem.totalFavorite} Favorits",
                                            style: TextStyle(
                                                fontWeight: medium,
                                                fontSize: 14,
                                                color: kprimaryTextColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(IconlyBold.play,
                                              size: 18,
                                              color: kprimaryTextColor),
                                          const SizedBox(width: 10),
                                          Flexible(
                                            child: Text(
                                              "${sleepMediaItem.totalListening} Listening",
                                              style: TextStyle(
                                                  fontWeight: medium,
                                                  fontSize: 14,
                                                  color: kprimaryTextColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 10, 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 24,
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kSecondaryColor),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          )),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Play",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                      ),
                                      padding: const EdgeInsets.all(5),
                                      child: IconButton(
                                          alignment: Alignment.center,
                                          onPressed: () {},
                                          icon: const Icon(
                                            IconlyLight.heart,
                                            color: Color(0xffE55871),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                      ),
                                      padding: const EdgeInsets.all(5),
                                      child: IconButton(
                                          alignment: Alignment.center,
                                          onPressed: () {},
                                          icon: const Icon(
                                            IconlyLight.download,
                                            color: kPrimaryColor,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    width: double.infinity,
                    color: kMediumPurpleTextColor,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Related Playlist",
                    style: TextStyle(
                        fontWeight: bold,
                        fontSize: 25,
                        color: kprimaryTextColor),
                  ),
                  const SizedBox(height: 30),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sleepMediaList
                        .where((item) => item.category.id == 2)
                        .toList()
                        .getRange(0, 4)
                        .toList()
                        .length,
                    itemBuilder: (context, i) {
                      return Hero(
                        tag: "related_img_$i",
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(
                                  heroTagName: "detail_img_$i",
                                  isRelated: false,
                                  sleepMediaItem: sleepMediaList[i],
                                );
                              }));
                            },
                            child: SleepCardItem(
                              image: sleepMediaList[i].imgUrl,
                              label: sleepMediaList[i].title,
                              subtitle:
                                  "${sleepMediaList[i].duration} | ${sleepMediaList[i].category.name}",
                            ),
                          ),
                        ),
                      );
                    },
                    padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )),
    ),
  );
}
