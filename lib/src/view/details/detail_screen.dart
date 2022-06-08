import 'package:flutter/material.dart';
import 'package:sleep/src/models/sleep_media_item.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/details/detail_desktop.dart';
import 'detail_mobile_tablet.dart';

class DetailScreen extends StatelessWidget {
  final SleepMediaItem sleepMediaItem;
  const DetailScreen(
      {Key? key,
      required this.heroTagName,
      required this.isRelated,
      required this.sleepMediaItem})
      : super(key: key);
  final String heroTagName;
  final bool isRelated;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      return Responsive(
          mobile: detailMobileTabletScreen(
            constraints: constraints,
            context: context,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            tag: heroTagName,
            isRelated: isRelated,
            sleepMediaItem: sleepMediaItem,
          ),
          tablet: detailMobileTabletScreen(
            constraints: constraints,
            context: context,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            tag: heroTagName,
            isRelated: isRelated,
            sleepMediaItem: sleepMediaItem,
          ),
          desktop: detailDesktopScreen(
            constraints: constraints,
            context: context,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            tag: heroTagName,
            isRelated: isRelated,
            sleepMediaItem: sleepMediaItem,
          ),
          largeDesktop: detailDesktopScreen(
            constraints: constraints,
            context: context,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            tag: heroTagName,
            isRelated: isRelated,
            sleepMediaItem: sleepMediaItem,
          ));
    }));
  }
}
