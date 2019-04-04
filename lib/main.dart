import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';
import 'find-a-provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Careington',
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      // home: new MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => AfterSplash(),
        '/home': (context) => MyHomePage(title: 'Careington'),
        '/find-a-provider': (context) => FindAProvider(title: 'FindAProvider')
      }
    );
  }
}


class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new MyHomePage(title: 'Careington'),
      imageBackground: AssetImage('assets/images/splash.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
