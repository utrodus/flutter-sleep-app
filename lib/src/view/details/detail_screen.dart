import 'package:flutter/material.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/details/detail_desktop.dart';
import 'detail_mobile_tablet.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key, required this.heroTagName, required this.isRelated})
      : super(key: key);
  final String heroTagName;
  final bool isRelated;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      return Responsive(
          mobile: detailMobileTabletScreen(constraints, context, screenHeight,
              screenWidth, heroTagName, isRelated),
          tablet: detailMobileTabletScreen(constraints, context, screenHeight,
              screenWidth, heroTagName, isRelated),
          desktop: detailDesktopScreen(constraints, context, screenHeight,
              screenWidth, heroTagName, isRelated),
          largeDesktop: detailDesktopScreen(constraints, context, screenHeight,
              screenWidth, heroTagName, isRelated));
    }));
  }
}
