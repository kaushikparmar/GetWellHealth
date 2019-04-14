import 'package:flutter/material.dart';
import 'routes.dart';


// Register the RouteObserver as a navigation observer.
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


class App extends StatelessWidget {
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
      routes: appRoutes
    );
  }
}
