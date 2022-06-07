import 'package:flutter/material.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/details/detail_desktop.dart';
import 'detail_mobile_tablet.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.heroTagName}) : super(key: key);
  final String heroTagName;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      return Responsive(
          mobile: detailMobileTabletScreen(
              constraints, context, screenHeight, screenWidth, heroTagName),
          tablet: detailMobileTabletScreen(
              constraints, context, screenHeight, screenWidth, heroTagName),
          desktop: detailDesktopScreen(
              constraints, context, screenHeight, screenWidth, heroTagName),
          largeDesktop: detailDesktopScreen(
              constraints, context, screenHeight, screenWidth, heroTagName));
    }));
  }
}
