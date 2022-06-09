import 'package:flutter/material.dart';
import 'package:sleep/src/themes.dart';
import 'package:sleep/src/view/welcome/welcome_screen.dart';

import 'utils/globals.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.sleepTheme,
      home: const WelcomeScreen(),
      scaffoldMessengerKey: snackbarKey,
    );
  }
}
