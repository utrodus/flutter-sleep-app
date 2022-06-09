import 'dart:convert';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sleep/src/utils/prefs_data.dart';

import '../../models/progress_bar_model.dart';
import '../../models/sleep_media_model.dart';
import '../../themes.dart';
import '../../models/sleep_media_source.dart';
import '../../view_models/detail_view_model.dart';
import '../widgets/sleep_card_item.dart';
import 'detail_screen.dart';

class DetailDesktopContent extends StatefulWidget {
  const DetailDesktopContent(
      {Key? key,
      required this.constraints,
      required this.context,
      required this.screenHeight,
      required this.screenWidth,
      required this.tag,
      required this.isRelated,
      required this.sleepMediaItem})
      : super(key: key);

  final BoxConstraints constraints;
  final BuildContext context;
  final double screenHeight;
  final double screenWidth;
  final Object tag;
  final bool isRelated;
  final SleepMediaItem sleepMediaItem;

  @override
  State<DetailDesktopContent> createState() => _DetailDesktopContentState();
}

class _DetailDesktopContentState extends State<DetailDesktopContent> {
  late final DetailViewModel _detailViewModel;
  bool isFavorited = false;
  List<SleepMediaItem> items = [];
  List<String> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    DetailViewModel.url = widget.sleepMediaItem.mediaUrl.toString();
    _detailViewModel = DetailViewModel();
    initData();
  }

  @override
  void dispose() {
    _detailViewModel.dispose();
    super.dispose();
  }

  void initData() {
    setState(() {
      /// Get data from local storage
      var data = PrefsData.getData('datas');
      data.then((value) {
        /// if data not empty
        if (value != null) {
          if (value != []) {
            /// assign  data to favoriteItems
            favoriteItems = value;
            for (var data in favoriteItems) {
              /// assign items data
              items.add(SleepMediaItem.fromJson(json.decode(data)));
            }

            /// check if item is favorited
            var myListFiltered =
                items.where((e) => e.title == widget.sleepMediaItem.title);
            if (myListFiltered.isNotEmpty) {
              setState(() {
                isFavorited = true;
              });
            }
          }
        }
      });
    });
  }

  void addToFavorite() {
    /// check if item is favorited
    var findItems = items.where((e) => e.title == widget.sleepMediaItem.title);
    if (findItems.isNotEmpty) {
      setState(() {
        items.remove(findItems.first);
        widget.sleepMediaItem.isFavorited = false;
        isFavorited = false;
      });
      if (items.isEmpty) {
        PrefsData.saveData('datas', []);
      } else {
        List<String> tempData = [];
        setState(() {
          favoriteItems = [];
          for (var item in items) {
            tempData.add(json.encode(item));
          }
          favoriteItems = tempData;
        });

        PrefsData.saveData('datas', favoriteItems);
      }
    }

    /// if item not favorited
    else {
      setState(() {
        isFavorited = true;
      });
      List<String> tempData = [];
      widget.sleepMediaItem.isFavorited = true;
      items.add(widget.sleepMediaItem);
      for (var item in items) {
        tempData.add(json.encode(item));
      }
      favoriteItems = tempData;
      PrefsData.saveData('datas', favoriteItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _detailViewModel.dispose();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
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
                  width: widget.screenWidth >= 1200 ? 1200 : widget.screenWidth,
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
                                tag: widget.isRelated ? Null : widget.tag,
                                child: FadeInImage.assetNetwork(
                                  placeholder: "assets/image_placeholder.jpg",
                                  width: widget.screenWidth * 0.3,
                                  fit: BoxFit.cover,
                                  image:
                                      widget.sleepMediaItem.imgUrl.toString(),
                                  imageErrorBuilder: (c, o, s) => Image.asset(
                                    "assets/image_placeholder.jpg",
                                    width: widget.screenWidth * 0.3,
                                    height: widget.screenHeight * 0.45,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 16),
                                    child: Text(
                                      "${widget.sleepMediaItem.duration} | ${widget.sleepMediaItem.category!.name}",
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
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 10, 25),
                                    child: Text(
                                      widget.sleepMediaItem.title.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                    child: Text(
                                      widget.sleepMediaItem.description
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: light,
                                        height: 1.8,
                                        fontSize: 16,
                                        color: kprimaryTextColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 15, 10, 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              IconlyBold.heart,
                                              size: 18,
                                              color: kprimaryTextColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "${widget.sleepMediaItem.totalFavorite} Favorites",
                                                style: TextStyle(
                                                  fontWeight: medium,
                                                  fontSize: 14,
                                                  color: kprimaryTextColor,
                                                ),
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
                                              const Icon(
                                                IconlyBold.play,
                                                size: 18,
                                                color: kprimaryTextColor,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "${widget.sleepMediaItem.totalListening} Listening",
                                                  style: TextStyle(
                                                    fontWeight: medium,
                                                    fontSize: 14,
                                                    color: kprimaryTextColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: ValueListenableBuilder<
                                          ProgressBarState>(
                                        valueListenable:
                                            _detailViewModel.progressNotifier,
                                        builder: (_, value, __) {
                                          return ProgressBar(
                                            thumbColor: kSecondaryColor,
                                            baseBarColor: kMediumPurpleColor,
                                            progressBarColor: kSecondaryColor,
                                            progress: value.current,
                                            buffered: value.buffered,
                                            total: value.total,
                                            onSeek: _detailViewModel.seek,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 5, 10, 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ValueListenableBuilder<
                                              ButtonState>(
                                            valueListenable:
                                                _detailViewModel.buttonNotifier,
                                            builder: (_, value, __) {
                                              switch (value) {
                                                case ButtonState.loading:
                                                  return ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding:
                                                          MaterialStateProperty
                                                              .all(const EdgeInsets
                                                                  .symmetric(
                                                        horizontal: 40,
                                                        vertical: 5,
                                                      )),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        kSecondaryColor,
                                                      ),
                                                      shape: MaterialStateProperty
                                                          .all<
                                                              RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            12.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: null,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child:
                                                          const CircularProgressIndicator(
                                                        color: kWhiteColor,
                                                        backgroundColor:
                                                            kSecondaryColor,
                                                      ),
                                                    ),
                                                  );

                                                case ButtonState.paused:
                                                  return ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding:
                                                          MaterialStateProperty
                                                              .all(const EdgeInsets
                                                                  .symmetric(
                                                        horizontal: 40,
                                                        vertical: 24,
                                                      )),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        kSecondaryColor,
                                                      ),
                                                      shape: MaterialStateProperty
                                                          .all<
                                                              RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      _detailViewModel.play();
                                                    },
                                                    child: const Text(
                                                      "PLAY",
                                                    ),
                                                  );
                                                case ButtonState.playing:
                                                  return ElevatedButton(
                                                    onPressed: () {
                                                      _detailViewModel.pause();
                                                    },
                                                    style: ButtonStyle(
                                                      padding:
                                                          MaterialStateProperty
                                                              .all(const EdgeInsets
                                                                  .symmetric(
                                                        horizontal: 40,
                                                        vertical: 24,
                                                      )),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  kSecondaryColor),
                                                      shape: MaterialStateProperty
                                                          .all<
                                                              RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "PAUSE",
                                                    ),
                                                  );
                                              }
                                            },
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
                                              onPressed: () {
                                                addToFavorite();
                                              },
                                              icon: Icon(
                                                isFavorited
                                                    ? IconlyBold.heart
                                                    : IconlyLight.heart,
                                                color: const Color(0xffE55871),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 20,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 1,
                        width: double.infinity,
                        color: kMediumPurpleTextColor,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Related Playlist",
                        style: TextStyle(
                            fontWeight: bold,
                            fontSize: 25,
                            color: kprimaryTextColor),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sleepMediaDataSource
                            .where((item) => item.category!.id == 2)
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
                                      sleepMediaItem: sleepMediaDataSource[i],
                                    );
                                  }));
                                },
                                child: SleepCardItem(
                                  image:
                                      sleepMediaDataSource[i].imgUrl.toString(),
                                  label:
                                      sleepMediaDataSource[i].title.toString(),
                                  subtitle:
                                      "${sleepMediaDataSource[i].duration} | ${sleepMediaDataSource[i].category!.name}",
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
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
