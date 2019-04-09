import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';
import 'find-a-provider.dart';
import 'current-prospective-member.dart';
import 'login.dart';
import 'registration.dart';
import 'in-app-browser.dart';

// Register the RouteObserver as a navigation observer.
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

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
      navigatorObservers: [routeObserver],
      routes: {
        '/': (context) => AfterSplash(),
        '/home': (context) => MyHomePage(title: 'Careington'),
        '/login': (context) => Login(title: 'Login'),
        '/registration': (context) => Registration(title: 'Registration'),
        '/find-a-provider': (context) => FindAProvider(title: 'FindAProvider'),
        '/current-prospective-member': (context) => CurrentProspectiveMember(title: 'CurrentProspectiveMember'),
        '/in-app-browser': (context) => InAppBrowser("https://www1.careington.com/mobile/search.aspx")
      }
    );
  }
}


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
