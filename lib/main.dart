import 'package:flutter/material.dart';

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
      home: new MyHomePage(title: 'Careington'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
      drawer: _navigationDrawer(),
      body: _body(),
      bottomNavigationBar: _footer(),
    );
  }

  // Body Widget
  Widget _body() {
    return new Container(
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new MaterialButton(
                minWidth: double.maxFinite,
                height: 50.0,
                child: new Text('LOGIN', style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {}
              ),
              decoration: const BoxDecoration(
                    border: const Border(
                        bottom: const BorderSide(width: 1.0, color: Colors.black87),
                        top: const BorderSide(width: 1.0, color: Colors.black87)
                    )
              ),
            ),
            new Container(
              child: new MaterialButton(
                minWidth: double.maxFinite,
                height: 50.0,
                child: new Text('REGISTER ACCOUNT', style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {}
              ),
              decoration: const BoxDecoration(
                    border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: Colors.black87))),
            ),
            new Container(
              child: new MaterialButton(
                minWidth: double.maxFinite,
                height: 50.0,
                child: new Text('FIND A PROVIDER', style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {}
              ),
              decoration: const BoxDecoration(
                    border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: Colors.black87))),
            ),
            new Container(
              child: new MaterialButton(
                minWidth: double.maxFinite,
                height: 50.0,
                child: new Text('SIGN UP', style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {}
              ),
              decoration: const BoxDecoration(
                    border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: Colors.black87))),
            )
          ],
        ),
      ),
    );
  }

  Widget _navigationDrawer() {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('HOME', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('MEMBER LOGIN', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('FIND A PROVIDER', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('CONTACT US', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('SETTINGS', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('SIGNUP', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('LOGOUT', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {}
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black87))),
          )
        ],
      ));
  }

  Widget _footer() {
    return new Container(
      height: 55.0,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        border: const Border(
          top: const BorderSide(width: 1.0, color: Colors.black54)
        )
      ),
      alignment: Alignment.center,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            child: new Image.asset('assets/images/home-red.png', height: 35.0)
          ),
          new Container(
            child: new Image.asset('assets/images/edit.png', height: 35.0)
          ),
          new Container(
            child: new Image.asset('assets/images/profile.png', height: 35.0)
          ),
          new Container(
            child: new Image.asset('assets/images/search.png', height: 35.0)
          ),
          new Container(
            child: new Image.asset('assets/images/back.png', height: 35.0)
          )
        ],
      ),
    );
  }
}
