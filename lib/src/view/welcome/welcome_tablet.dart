import 'package:flutter/material.dart';
import 'package:sleep/src/utils/responsive.dart';

import '../../themes.dart';
import '../home/home_screen.dart';
import '../widgets/primary_btn.dart';

Scaffold welcomeTablet(BuildContext context, double screenWidth) {
  return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image_bg_welcome.png"),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome to Sleep",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize:
                          Responsive.isTabletLandscape(context) ? 30 : 28),
                ),
              ),
              Padding(
                padding: Responsive.isTabletLandscape(context)
                    ? const EdgeInsets.fromLTRB(150, 15, 150, 15)
                    : const EdgeInsets.fromLTRB(120, 15, 120, 15),
                child: Center(
                  child: Text(
                    "Explore the new king of sleep. It uses sound and vesualization to create perfect conditions for refreshing sleep.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1.8,
                          fontSize:
                              Responsive.isTabletLandscape(context) ? 24 : 18,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image(
                  width: Responsive.isTabletLandscape(context)
                      ? screenWidth * 0.65
                      : screenWidth * 0.75,
                  image: const AssetImage("assets/image_bird_ilustration.png"),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              PrimaryBtn(
                label: "GET STARTED",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }), (route) => false);
                },
              )
            ],
          ),
        ),
      ));
}
