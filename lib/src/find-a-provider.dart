import 'package:flutter/material.dart';
import 'sidebar-navigation.dart';
import 'footer.dart';

class FindAProvider extends StatefulWidget {
  final String title;

  FindAProvider({Key key, this.title}) : super(key: key);

  @override
  _FindAProvider createState() => new _FindAProvider();
}

class _FindAProvider extends State<FindAProvider> {

  @override
  Widget build(BuildContext context) {
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
      drawer: SidebarNavigation(ModalRoute.of(context).settings.name),
      body: body(context),
      bottomNavigationBar: footer(context),
    );
  }
}

// Body Widget
Widget body(context) {
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
              color: Colors.black54,
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
            border: Border(bottom: BorderSide(color: Colors.black54))
          ),
          child: new Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Expanded(
                  child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Zip Code',
                      counterText: '',
                      hintStyle: TextStyle(fontSize: 20.0),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black45,
                    maxLength: 5,
                    maxLines: 1,
                  ),
                ),
                new MaterialButton(
                      child: Image.asset('assets/images/locationPointer.png', height: 40.0,),
                      minWidth: 50.0,
                      height: 50.0,
                      color: Colors.red,
                      onPressed: (){},
                )
              ],
            ),
        ),
        new Container(
          child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('FIND A PROVIDER',
                  style: new TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {}),
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 1.0, color: Colors.black54),
                  // top: const BorderSide(width: 1.0, color: Colors.black54)
              )
          ),
        )
      ],
    )
  );
}
