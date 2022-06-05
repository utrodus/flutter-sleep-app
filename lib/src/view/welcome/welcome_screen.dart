import 'package:flutter/material.dart';
import 'package:sleep/src/themes.dart';
import 'package:sleep/src/view/home/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image_bg_welcome.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Welcome to Sleep",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(48, 15, 48, 15),
                    child: Center(
                      child: Text(
                        "Explore the new king of sleep. It uses sound and vesualization to create perfect conditions for refreshing sleep.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              height: 1.8,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Image(
                      width: 369,
                      image: AssetImage("assets/image_bird_ilustration.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(130, 15, 130, 15)),
                      backgroundColor:
                          MaterialStateProperty.all(kSecondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    },
                    child: Text(
                      "GET STARTED",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
