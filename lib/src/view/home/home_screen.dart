import 'package:flutter/material.dart';
import 'package:sleep/src/themes.dart';

import '../widgets/icon_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWitdh = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
            child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const Image(
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
                            "Sleep Stories",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(48, 15, 48, 15),
                          child: Center(
                            child: Text(
                              "Soothing bedtime stories to help you fall\ninto a deep and natural sleep",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    height: 1.4,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(10, 25, 20, 0),
                          child: Row(
                            children: const [
                              IconMenu(
                                icon: "assets/icon_menu_all.png",
                                label: "All",
                                isSelected: true,
                              ),
                              IconMenu(
                                icon: "assets/icon_menu_favorite.png",
                                label: "My",
                                isSelected: false,
                              ),
                              IconMenu(
                                icon: "assets/icon_menu_anxious.png",
                                label: "Anxious",
                                isSelected: false,
                              ),
                              IconMenu(
                                icon: "assets/icon_menu_sleep.png",
                                label: "Sleep",
                                isSelected: false,
                              ),
                              IconMenu(
                                icon: "assets/icon_menu_kids.png",
                                label: "Kids",
                                isSelected: false,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 15),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Container(
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //           image: const DecorationImage(
                        //             image: AssetImage(
                        //                 "assets/image_akudansepi.jpg"),
                        //             fit: BoxFit.cover,
                        //             alignment: Alignment.center,
                        //           ),
                        //           borderRadius: BorderRadius.circular(12)),
                        //       height: screenHeight * 0.3,
                        //       alignment: Alignment.center,
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/image_placeholder.jpg",
                              height: screenHeight * 0.3,
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
                        const SizedBox(
                          height: 25,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 8,
                          itemBuilder: (context, i) {
                            return const SleepCardItem(
                              image:
                                  "https://i3.ytimg.com/vi/8nlPnuIoTMs/maxresdefault.jpg",
                              label: "Harus Menikah",
                              subtitle: "45 Min | Sleep Stories",
                            );
                          },
                          padding: const EdgeInsets.fromLTRB(25, 5, 18, 0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      constraints.maxWidth > 700 ? 4 : 2,
                                  childAspectRatio: 1.05,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        })),
      ),
    );
  }
}

class SleepCardItem extends StatelessWidget {
  const SleepCardItem({
    Key? key,
    required this.image,
    required this.label,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String label;
  final String subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: InkWell(
        onTap: onTap,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/image_placeholder.jpg",
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: image,
                  imageErrorBuilder: (c, o, s) => Image.asset(
                    "assets/image_placeholder.jpg",
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          label,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: mediumBrownTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 11,
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
      ),
    );
  }
}
