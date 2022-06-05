import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sleep/src/themes.dart';

import '../widgets/sleep_card_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.heroTagName}) : super(key: key);
  final String heroTagName;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
            child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: heroTagName,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/image_placeholder.jpg",
                        height: screenHeight * 0.38,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image:
                            "https://i3.ytimg.com/vi/Nof0phtUdwg/maxresdefault.jpg",
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          "assets/image_placeholder.jpg",
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: Material(
                          color: kWhiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: IconButton(
                                  alignment: Alignment.center,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    IconlyLight.arrowLeft,
                                    color: kPrimaryColor,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                            child: Material(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                      alignment: Alignment.center,
                                      onPressed: () {},
                                      icon: const Icon(
                                        IconlyLight.heart,
                                        color: kWhiteColor,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                            child: Material(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                      alignment: Alignment.center,
                                      onPressed: () {},
                                      icon: const Icon(
                                        IconlyLight.download,
                                        color: kWhiteColor,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 10, 15),
                child: Text(
                  "Aku & Sepi yang kusimpan rapi",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Text(
                  "45 MIN | SLEEP MUSIC",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: mediumBrownTextStyle.copyWith(
                    fontWeight: medium,
                    letterSpacing: 1.2,
                    fontSize: 11,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Text(
                  "Ease the mind into a restful night’s sleep  with these deep, amblent tones.",
                  style: TextStyle(
                      fontWeight: light,
                      height: 1.8,
                      fontSize: 16,
                      color: kprimaryTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 10, 20),
                child: Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(IconlyBold.heart,
                            size: 18, color: kprimaryTextColor),
                        const SizedBox(width: 10),
                        Text(
                          "24.234 Favorits",
                          style: TextStyle(
                              fontWeight: medium,
                              fontSize: 14,
                              color: kprimaryTextColor),
                        ),
                      ],
                    ),
                    const SizedBox(width: 49),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(IconlyBold.play,
                            size: 18, color: kprimaryTextColor),
                        const SizedBox(width: 10),
                        Text(
                          "34.234 Listening",
                          style: TextStyle(
                              fontWeight: medium,
                              fontSize: 14,
                              color: kprimaryTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 0.5,
                width: double.infinity,
                color: kMediumPurpleTextColor,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Related",
                  style: TextStyle(
                      fontWeight: bold, fontSize: 20, color: kprimaryTextColor),
                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   child: GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 4,
              //     itemBuilder: (context, i) {
              //       return Hero(
              //         tag: "detail_img_${i.toString()}",
              //         child: SleepCardItem(
              //           onTap: () {
              //             Navigator.push(context,
              //                 MaterialPageRoute(builder: (context) {
              //               return DetailScreen(
              //                 heroTagName: "detail_img_${i.toString()}",
              //               );
              //             }));
              //           },
              //           image:
              //               "https://i3.ytimg.com/vi/8nlPnuIoTMs/maxresdefault.jpg",
              //           label: "Harus Menikah",
              //           subtitle: "45 Min | Sleep Stories",
              //         ),
              //       );
              //     },
              //     padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
              //         childAspectRatio: 1.05,
              //         crossAxisSpacing: 10,
              //         mainAxisSpacing: 3),
              //   ),
              // ),
              const SizedBox(height: 80),
            ],
          );
        })),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            color: kSecondaryColor,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(28)),
              onTap: () {},
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: screenHeight * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "PLAY",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: bold,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
