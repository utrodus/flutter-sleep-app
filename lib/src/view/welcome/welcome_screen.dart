import 'package:flutter/material.dart';
import 'package:sleep/src/utils/responsive.dart';
import 'package:sleep/src/view/welcome/welcome_desktop.dart';
import 'package:sleep/src/view/welcome/welcome_tablet.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'welcome_large_desktop.dart';
import 'welcome_mobile.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Responsive(
        mobile: welcomeMobile(context, screenWidth),
        tablet: welcomeTablet(context, screenWidth),
        desktop: welcomeDesktop(context, screenWidth),
        largeDesktop: welcomeLargeDesktop(context, screenWidth),
      ),
    );
  }
}
