import 'package:flutter/material.dart';
import 'sidebar-navigation.dart';
import 'footer.dart';

class FindAProvider extends StatefulWidget {
  FindAProvider({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _FindAProvider createState() => new _FindAProvider();
}

class _FindAProvider extends State<FindAProvider> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Container(
          margin: EdgeInsets.only(left: 130.0),
          child: new Image.asset('assets/images/care-logo.png', height: 25.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      drawer: navigationDrawer(),
      body: body(),
      bottomNavigationBar: footer(context),
    );
  }
}

// Body Widget
Widget body() {
  return new Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/bg.png'))),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            )
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new Container(
                  child: new Text('FIND A PROVIDER', style: new TextStyle(color: Colors.red, fontSize: 22.0, fontWeight: FontWeight.bold)),
                  margin: EdgeInsets.all(8.0),
                ),
                new Container(
                  child: new Text('Enter your zipcode below', style: new TextStyle(color: Colors.black54, fontSize: 22.0))
                ),
              ],
            ),
        ),
        new Container(
          alignment: Alignment.center,
          // height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            )
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new Container(
                  child: new TextFormField(
                    decoration: InputDecoration(hintText: 'Zip Code', border: InputBorder.none),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black45,
                    maxLength: 5,
                    maxLines: 1,
                  ),
                )
              ],
            ),
        )
      ],
    )
  );
}
