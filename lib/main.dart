import 'package:flutter/material.dart';
import 'home.dart';
import 'find-a-provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      // home: new MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Careington'),
        'find-a-provider': (context) => FindAProvider(title: 'FindAProvider')
      }
    );
  }
}
