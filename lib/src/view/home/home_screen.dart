import 'package:flutter/material.dart';
import 'package:sleep/src/themes.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/details/detail_screen.dart';
import 'package:sleep/src/view_models/home_view_model.dart';

import '../../models/sleep_media_model.dart';
import '../widgets/icon_menu.dart';
import '../widgets/sleep_card_item.dart';
import '../widgets/sleep_item_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  List<SleepMediaItem> sleepMediaDatas = [];
  String title = "";
  String subtitle = "";
  bool isLoading = false;
  int selectedCategoryId = 0;
  void getSleepMediaDatas() {
    setState(() {
      isLoading = true;
    });
    getMediaDatas().then((value) {
      setState(() {
        sleepMediaDatas = value;
        isLoading = false;
      });
    });
  }

  void getFilterSleepMediaDatas(int categoryId) {
    setState(() {
      sleepMediaDatas = [];
      isLoading = true;
    });
    getMediaDatas(categoryId: categoryId).then((value) {
      setState(() {
        sleepMediaDatas = value;
        isLoading = false;
      });
    });
  }

  void changePageText(id) {
    switch (id) {
      case 0:
        setState(() {
          title = "Sleep Stories & Music";
          subtitle = "Best Sleep Stories and Music\nfrom the Sleep Community";
        });
        break;
      case 1:
        setState(() {
          title = "A Bedtime Story";
          subtitle =
              "Discover stories that will help you fall\ninto a deep and natural sleep";
        });
        break;
      case 2:
        setState(() {
          title = "Sleep Music";
          subtitle =
              "Sleep Music is a collection of songs that\nwill help you fall into a deep and natural sleep";
        });
        break;
      case 3:
        setState(() {
          title = "Are You Anxious ?";
          subtitle =
              "We Help you to find the best sleep stories\nand music for your anxiety";
        });
        break;
      case 4:
        setState(() {
          title = "My Favorite";
          subtitle =
              "Add your favorite sleep stories and music to your Sleep App";
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    changePageText(0);
    getSleepMediaDatas();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Responsive(
            mobile: _homeTabletMobileScreen(screenHeight),
            tablet: _homeTabletMobileScreen(screenHeight),
            desktop: Scrollbar(
              controller: _scrollController,
              trackVisibility: true,
              thickness: 10,
              radius: const Radius.circular(10),
              child: _homeDesktopScreen(screenHeight, _scrollController),
            ),
            largeDesktop: Scrollbar(
              controller: _scrollController,
              trackVisibility: true,
              thickness: 10,
              radius: const Radius.circular(10),
              child: _homeDesktopScreen(screenHeight, _scrollController),
            )),
      ),
    );
  }

  SingleChildScrollView _homeTabletMobileScreen(
    double screenHeight,
  ) {
    return SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              const Image(
                width: double.infinity,
                image: AssetImage("assets/image_bg_home.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 15, 48, 15),
                      child: Center(
                        child: Text(
                          subtitle,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    height: 1.4,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(10, 25, 20, 0),
                      child: Row(
                        children: [
                          IconMenu(
                            onTap: () {
                              getSleepMediaDatas();
                              setState(() {
                                selectedCategoryId = 0;
                              });
                              changePageText(selectedCategoryId);
                            },
                            icon: "assets/icon_menu_all.png",
                            label: "All",
                            isSelected: selectedCategoryId == 0 ? true : false,
                          ),
                          IconMenu(
                            onTap: () {
                              getFilterSleepMediaDatas(4);
                              setState(() {
                                selectedCategoryId = 4;
                              });
                              changePageText(selectedCategoryId);
                            },
                            icon: "assets/icon_menu_favorite.png",
                            label: "My",
                            isSelected: selectedCategoryId == 4 ? true : false,
                          ),
                          IconMenu(
                            onTap: () {
                              getFilterSleepMediaDatas(1);
                              setState(() {
                                selectedCategoryId = 1;
                              });
                              changePageText(selectedCategoryId);
                            },
                            icon: "assets/icon_menu_sleep.png",
                            label: "Stories",
                            isSelected: selectedCategoryId == 1 ? true : false,
                          ),
                          IconMenu(
                            onTap: () {
                              getFilterSleepMediaDatas(2);
                              setState(() {
                                selectedCategoryId = 2;
                              });
                              changePageText(selectedCategoryId);
                            },
                            icon: "assets/icon_menu_music.png",
                            label: "Music",
                            isSelected: selectedCategoryId == 2 ? true : false,
                          ),
                          IconMenu(
                            onTap: () {
                              getFilterSleepMediaDatas(3);
                              setState(() {
                                selectedCategoryId = 3;
                              });
                              changePageText(selectedCategoryId);
                            },
                            icon: "assets/icon_menu_anxious.png",
                            label: "Anxious",
                            isSelected: selectedCategoryId == 3 ? true : false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Visibility(
                      visible: selectedCategoryId == 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(
                                  heroTagName: "feature_img",
                                  isRelated: false,
                                  sleepMediaItem: SleepMediaItem(
                                    title: "Mencari Kebahagiaan",
                                    category: SleepMediaCategory(
                                        id: 1, name: "Sleep Stories"),
                                    duration: "01:00",
                                    imgUrl:
                                        "https://i.ibb.co/3pp9F4s/maxresdefault-1.jpg",
                                    description:
                                        "Hidup Yang Bahagia Adalah Hidup Yang sederhana.",
                                    mediaUrl:
                                        "https://archive.org/download/mencari-kebahagiaan-dr-fahrudin-faiz/Mencari%20Kebahagiaan%20%20Dr%20Fahrudin%20Faiz.mp3",
                                    totalFavorite: "2000.000",
                                    totalListening: "50.000",
                                    isFavorited: false,
                                  ),
                                );
                              }));
                            },
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: "feature_img",
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: FadeInImage.assetNetwork(
                                  placeholder: "assets/image_placeholder.jpg",
                                  height: constraints.maxWidth > 600
                                      ? screenHeight * 0.4
                                      : screenHeight * 0.3,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerLeft,
                                  image:
                                      "https://i.ibb.co/3pp9F4s/maxresdefault-1.jpg",
                                  imageErrorBuilder: (c, o, s) => Image.asset(
                                    "assets/image_placeholder.jpg",
                                    height: constraints.maxWidth > 600
                                        ? screenHeight * 0.4
                                        : screenHeight * 0.3,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: selectedCategoryId == 4 &&
                            sleepMediaDatas.isEmpty &&
                            isLoading == false,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Image(
                              image:
                                  AssetImage("assets/ilustration_people.png"),
                              alignment: Alignment.center,
                              width: 300,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You Don't Have Favorite Stories & Music",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontWeight: medium,
                                    height: 1.4,
                                  ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Let's Add Stories & Music To Favorites",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontWeight: medium,
                                    height: 1.4,
                                  ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    isLoading && selectedCategoryId != 4
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 8,
                            itemBuilder: (context, i) {
                              return sleepItemLoading(context);
                            },
                            padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  Responsive.isTabletPotrait(context)
                                      ? 3
                                      : Responsive.isTabletLandscape(context)
                                          ? 4
                                          : 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 10,
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: sleepMediaDatas.length,
                            itemBuilder: (context, i) {
                              return Hero(
                                tag: "detail_img_$i",
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
                                          sleepMediaItem: sleepMediaDatas[i],
                                        );
                                      }));
                                    },
                                    child: SleepCardItem(
                                      image:
                                          sleepMediaDatas[i].imgUrl.toString(),
                                      label:
                                          sleepMediaDatas[i].title.toString(),
                                      subtitle:
                                          "${sleepMediaDatas[i].duration} | ${sleepMediaDatas[i].category!.name}",
                                    ),
                                  ),
                                ),
                              );
                            },
                            padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  Responsive.isTabletPotrait(context)
                                      ? 3
                                      : Responsive.isTabletLandscape(context)
                                          ? 4
                                          : 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }));
  }

  LayoutBuilder _homeDesktopScreen(
      double screenHeight, ScrollController? controller) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconMenu(
                  onTap: () {
                    getSleepMediaDatas();
                    setState(() {
                      selectedCategoryId = 0;
                    });
                    changePageText(selectedCategoryId);
                  },
                  icon: "assets/icon_menu_all.png",
                  label: "All",
                  isSelected: selectedCategoryId == 0 ? true : false,
                ),
                IconMenu(
                  onTap: () {
                    getFilterSleepMediaDatas(4);
                    setState(() {
                      selectedCategoryId = 4;
                    });
                    changePageText(selectedCategoryId);
                  },
                  icon: "assets/icon_menu_favorite.png",
                  label: "My",
                  isSelected: selectedCategoryId == 4 ? true : false,
                ),
                IconMenu(
                  onTap: () {
                    getFilterSleepMediaDatas(1);
                    setState(() {
                      selectedCategoryId = 1;
                    });
                    changePageText(selectedCategoryId);
                  },
                  icon: "assets/icon_menu_sleep.png",
                  label: "Stories",
                  isSelected: selectedCategoryId == 1 ? true : false,
                ),
                IconMenu(
                  onTap: () {
                    getFilterSleepMediaDatas(2);
                    setState(() {
                      selectedCategoryId = 2;
                    });
                    changePageText(selectedCategoryId);
                  },
                  icon: "assets/icon_menu_music.png",
                  label: "Music",
                  isSelected: selectedCategoryId == 2 ? true : false,
                ),
                IconMenu(
                  onTap: () {
                    getFilterSleepMediaDatas(3);
                    setState(() {
                      selectedCategoryId = 3;
                    });
                    changePageText(selectedCategoryId);
                  },
                  icon: "assets/icon_menu_anxious.png",
                  label: "Anxious",
                  isSelected: selectedCategoryId == 3 ? true : false,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Image(
                    width: double.infinity,
                    image: AssetImage("assets/image_bg_home.png"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: constraints.maxWidth > 1200
                        ? 1200
                        : constraints.maxWidth,
                    padding: const EdgeInsets.fromLTRB(40, 60, 40, 20),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 32,
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            subtitle,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      height: 1.4,
                                      fontSize: 22,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Visibility(
                          visible: selectedCategoryId == 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailScreen(
                                      heroTagName: "feature_img",
                                      isRelated: false,
                                      sleepMediaItem: SleepMediaItem(
                                        title: "Mencari Kebahagiaan",
                                        category: SleepMediaCategory(
                                            id: 1, name: "Sleep Stories"),
                                        duration: "01:00",
                                        imgUrl:
                                            "https://i.ibb.co/3pp9F4s/maxresdefault-1.jpg",
                                        description:
                                            "Hidup Yang Bahagia Adalah Hidup Yang sederhana.",
                                        mediaUrl:
                                            "https://archive.org/download/mencari-kebahagiaan-dr-fahrudin-faiz/Mencari%20Kebahagiaan%20%20Dr%20Fahrudin%20Faiz.mp3",
                                        totalFavorite: "2000.000",
                                        totalListening: "50.000",
                                        isFavorited: false,
                                      ),
                                    );
                                  }));
                                },
                                child: Hero(
                                  transitionOnUserGestures: true,
                                  tag: "feature_img",
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          "assets/image_placeholder.jpg",
                                      height: screenHeight * 0.45,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      image:
                                          "https://i.ibb.co/3pp9F4s/maxresdefault-1.jpg",
                                      imageErrorBuilder: (c, o, s) =>
                                          Image.asset(
                                        "assets/image_placeholder.jpg",
                                        height: screenHeight * 0.45,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: selectedCategoryId == 4 &&
                                sleepMediaDatas.isEmpty &&
                                isLoading == false,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Image(
                                  image: const AssetImage(
                                      "assets/ilustration_people.png"),
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "You Don't Have Favorite Stories & Music",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontWeight: light,
                                        fontSize: 18,
                                      ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Let's Add Stories & Music To Favorites",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontWeight: light,
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        isLoading && selectedCategoryId != 4
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 8,
                                itemBuilder: (context, i) {
                                  return sleepItemLoading(context);
                                },
                                padding:
                                    const EdgeInsets.fromLTRB(25, 5, 18, 0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: constraints.maxWidth > 1440
                                      ? 6
                                      : constraints.maxWidth > 1200
                                          ? 5
                                          : 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                ),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sleepMediaDatas.length,
                                itemBuilder: (context, i) {
                                  return Hero(
                                    tag: "detail_img_$i",
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return DetailScreen(
                                              heroTagName: "detail_img_$i",
                                              isRelated: false,
                                              sleepMediaItem:
                                                  sleepMediaDatas[i],
                                            );
                                          }));
                                        },
                                        child: SleepCardItem(
                                          image: sleepMediaDatas[i]
                                              .imgUrl
                                              .toString(),
                                          label: sleepMediaDatas[i]
                                              .title
                                              .toString(),
                                          subtitle:
                                              "${sleepMediaDatas[i].duration} | ${sleepMediaDatas[i].category!.name}",
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                padding:
                                    const EdgeInsets.fromLTRB(25, 5, 18, 0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: constraints.maxWidth > 1440
                                      ? 6
                                      : constraints.maxWidth > 1200
                                          ? 5
                                          : 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
