import 'package:flutter/material.dart';

import '../../themes.dart';
import '../home/home_screen.dart';
import '../widgets/primary_btn.dart';

Scaffold welcomeDesktop(BuildContext context, double screenWidth) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      child: Text(
                        "Welcome to Sleep",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      child: Text(
                        "Explore the new king of sleep. It uses sound and vesualization to create perfect conditions for refreshing sleep.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              height: 1.8,
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: PrimaryBtn(
                        label: "GET STARTED",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }), (route) => false);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image(
                  width: screenWidth * 0.5,
                  image: const AssetImage("assets/image_bird_ilustration.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ));
}
