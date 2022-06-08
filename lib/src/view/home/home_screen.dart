import 'package:flutter/material.dart';
import 'package:sleep/src/themes.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/details/detail_screen.dart';

import '../widgets/icon_menu.dart';
import '../widgets/sleep_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
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
                            onTap: () {},
                            icon: "assets/icon_menu_all.png",
                            label: "All",
                            isSelected: true,
                          ),
                          IconMenu(
                            onTap: () {},
                            icon: "assets/icon_menu_favorite.png",
                            label: "My",
                            isSelected: false,
                          ),
                          IconMenu(
                            onTap: () {},
                            icon: "assets/icon_menu_sleep.png",
                            label: "Stories",
                            isSelected: false,
                          ),
                          IconMenu(
                            onTap: () {},
                            icon: "assets/icon_menu_music.png",
                            label: "Music",
                            isSelected: false,
                          ),
                          IconMenu(
                            onTap: () {},
                            icon: "assets/icon_menu_anxious.png",
                            label: "Anxious",
                            isSelected: false,
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
                                    "https://i.ibb.co/r0Ln7Wc/image-akudansepi.jpg",
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
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
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
                              child: const SleepCardItem(
                                image:
                                    "https://i.ibb.co/r3zfjmq/image-nyatakansekarang.jpg",
                                label: "Harus Menikah",
                                subtitle: "45 Min | Sleep Stories",
                              ),
                            ),
                          ),
                        );
                      },
                      padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isTabletPotrait(context)
                            ? 3
                            : Responsive.isTabletLandscape(context)
                                ? 4
                                : 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                      ),
                    )
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
                  onTap: () {},
                  icon: "assets/icon_menu_all.png",
                  label: "All",
                  isSelected: true,
                ),
                IconMenu(
                  onTap: () {},
                  icon: "assets/icon_menu_favorite.png",
                  label: "My",
                  isSelected: false,
                ),
                IconMenu(
                  onTap: () {},
                  icon: "assets/icon_menu_sleep.png",
                  label: "Stories",
                  isSelected: false,
                ),
                IconMenu(
                  onTap: () {},
                  icon: "assets/icon_menu_music.png",
                  label: "Music",
                  isSelected: false,
                ),
                IconMenu(
                  onTap: () {},
                  icon: "assets/icon_menu_anxious.png",
                  label: "Anxious",
                  isSelected: false,
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
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 8,
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
                                  child: const SleepCardItem(
                                    image:
                                        "https://i.ibb.co/r3zfjmq/image-nyatakansekarang.jpg",
                                    label: "Harus Menikah",
                                    subtitle: "45 Min | Sleep Stories",
                                  ),
                                ),
                              ),
                            );
                          },
                          padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
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
