import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: '/home',
      imageBackground: AssetImage('assets/images/splash.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}