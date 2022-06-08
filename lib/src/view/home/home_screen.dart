import 'package:flutter/material.dart';
import 'package:sleep/src/themes.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/details/detail_screen.dart';
import 'package:sleep/src/view_models/media_view_model.dart';

import '../../models/sleep_media_item.dart';
import '../widgets/icon_menu.dart';
import '../widgets/sleep_card_item.dart';
import '../widgets/sleep_item_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  List<SleepMediaItem> sleepMediaDatas = [];
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

  @override
  void initState() {
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
                child: _homeDesktopScreen(screenHeight, _scrollController)),
            largeDesktop: Scrollbar(
                controller: _scrollController,
                trackVisibility: true,
                thickness: 10,
                radius: const Radius.circular(10),
                child: _homeDesktopScreen(screenHeight, _scrollController))),
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
                        "Sleep Stories & Music",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 15, 48, 15),
                      child: Center(
                        child: Text(
                          "Soothing bedtime stories to help you fall\ninto a deep and natural sleep",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DetailScreen(
                                heroTagName: "feature_img",
                                isRelated: false,
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
                                image:
                                    "https://i.ibb.co/jr2P6YZ/maxresdefault-1.jpg",
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
                    const SizedBox(
                      height: 25,
                    ),
                    isLoading
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
                                        );
                                      }));
                                    },
                                    child: SleepCardItem(
                                      image: sleepMediaDatas[i].imgUrl,
                                      label: sleepMediaDatas[i].title,
                                      subtitle:
                                          "${sleepMediaDatas[i].duration} | ${sleepMediaDatas[i].category.name}",
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
                            "Sleep Stories & Music",
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
                            "Soothing bedtime stories to help you fall\ninto a deep and natural sleep",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const DetailScreen(
                                    heroTagName: "feature_img",
                                    isRelated: false,
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
                                    placeholder: "assets/image_placeholder.jpg",
                                    height: screenHeight * 0.45,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    image:
                                        "https://i.ibb.co/r0Ln7Wc/image-akudansepi.jpg",
                                    imageErrorBuilder: (c, o, s) => Image.asset(
                                      "assets/image_placeholder.jpg",
                                      height: screenHeight * 0.45,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        isLoading
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
                                            );
                                          }));
                                        },
                                        child: SleepCardItem(
                                          image: sleepMediaDatas[i].imgUrl,
                                          label: sleepMediaDatas[i].title,
                                          subtitle:
                                              "${sleepMediaDatas[i].duration} | ${sleepMediaDatas[i].category.name}",
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
