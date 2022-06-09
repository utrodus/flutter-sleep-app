import 'dart:convert';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sleep/src/view/details/detail_screen.dart';

import '../../models/progress_bar_model.dart';
import '../../models/sleep_media_model.dart';
import '../../models/sleep_media_source.dart';
import '../../themes.dart';
import '../../utils/globals.dart';
import '../../utils/prefs_data.dart';
import '../../view_models/detail_view_model.dart';
import '../widgets/sleep_card_item.dart';

class DetailMobileTabletContent extends StatefulWidget {
  const DetailMobileTabletContent(
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
  State<DetailMobileTabletContent> createState() =>
      _DetailMobileTabletContentState();
}

class _DetailMobileTabletContentState extends State<DetailMobileTabletContent> {
  late final DetailViewModel _detailViewModel;
  List<SleepMediaItem> items = [];
  List<String> favoriteItems = [];
  bool isFavorited = false;

  @override
  void initState() {
    DetailViewModel.url = widget.sleepMediaItem.mediaUrl.toString();
    _detailViewModel = DetailViewModel();
    super.initState();
    initData();
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
            var findItems =
                items.where((e) => e.title == widget.sleepMediaItem.title);
            if (findItems.isNotEmpty) {
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
        /// remove current item from favorites list
        items.remove(findItems.first);
        widget.sleepMediaItem.isFavorited = false;
        isFavorited = false;
      });
      if (items.isEmpty) {
        /// if items is empty, remove item from local storage
        PrefsData.saveData('datas', []);
        snackbarKey.currentState?.showSnackBar(SnackBar(
          content: Text(
            "You have removed this item from favorites",
            style: TextStyle(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xffE74C3C),
        ));
      } else {
        /// remove current item from favorites local storage
        List<String> tempData = [];
        setState(() {
          favoriteItems = [];
          for (var item in items) {
            tempData.add(json.encode(item));
          }
          favoriteItems = tempData;
        });

        PrefsData.saveData('datas', favoriteItems);
        snackbarKey.currentState?.showSnackBar(SnackBar(
          content: Text(
            "You have removed this item from favorites",
            style: TextStyle(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xffE74C3C),
        ));
      }
    }

    /// if item not found from favorited local storage
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
      snackbarKey.currentState?.showSnackBar(SnackBar(
        content: Text(
          "You have added this item to favorites",
          style: TextStyle(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xff519727),
      ));
    }
  }

  @override
  void dispose() {
    _detailViewModel.dispose();
    super.dispose();
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
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.isRelated ? Null : widget.tag,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/image_placeholder.jpg",
                        height: widget.constraints.maxWidth > 600
                            ? widget.screenHeight * 0.65
                            : widget.screenHeight * 0.38,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: widget.sleepMediaItem.imgUrl.toString(),
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          "assets/image_placeholder.jpg",
                          height: widget.screenHeight * 0.38,
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
                            onTap: () {
                              _detailViewModel.dispose();
                              Navigator.pop(context);
                            },
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
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Container(
                                  alignment: Alignment.center,
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
                  widget.sleepMediaItem.title.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
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
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Text(
                  widget.sleepMediaItem.description.toString(),
                  style: TextStyle(
                    fontWeight: light,
                    height: 1.8,
                    fontSize: 16,
                    color: kprimaryTextColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          IconlyBold.heart,
                          size: 18,
                          color: kprimaryTextColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${widget.sleepMediaItem.totalFavorite} Favorites",
                          style: TextStyle(
                            fontWeight: medium,
                            fontSize: 14,
                            color: kprimaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ValueListenableBuilder<ProgressBarState>(
                    valueListenable: _detailViewModel.progressNotifier,
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
              Center(
                child: ValueListenableBuilder<ButtonState>(
                  valueListenable: _detailViewModel.buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            primary: kSecondaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: widget.screenWidth * 0.38,
                                vertical: 12),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: const CircularProgressIndicator(
                              color: kWhiteColor,
                              backgroundColor: kSecondaryColor,
                            ),
                          ),
                        );
                      case ButtonState.paused:
                        return ElevatedButton(
                          onPressed: () async {
                            _detailViewModel.play();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kSecondaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: widget.screenWidth * 0.38,
                                vertical: 25),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "PLAY",
                          ),
                        );
                      case ButtonState.playing:
                        return ElevatedButton(
                          onPressed: () {
                            _detailViewModel.pause();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kSecondaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: widget.screenWidth * 0.38,
                                vertical: 25),
                            textStyle: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                height: 20,
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Related",
                  style: TextStyle(
                    fontWeight: bold,
                    fontSize: 20,
                    color: kprimaryTextColor,
                  ),
                ),
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
                          image: sleepMediaDataSource[i].imgUrl.toString(),
                          label: sleepMediaDataSource[i].title.toString(),
                          subtitle:
                              "${sleepMediaDataSource[i].duration} | ${sleepMediaDataSource[i].category!.name}",
                        ),
                      ),
                    ),
                  );
                },
                padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.constraints.maxWidth > 600 ? 3 : 2,
                  childAspectRatio: 1.05,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 3,
                ),
              ),
              SizedBox(
                height: widget.constraints.maxWidth > 600 ? 10 : 80,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
