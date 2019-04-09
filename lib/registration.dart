import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'sidebar-navigation.dart';
import 'footer.dart';
import 'in-app-browser.dart';

class Registration extends StatefulWidget {
  Registration({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Registration createState() => new _Registration();
}

class _Registration extends State<Registration> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.red),
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
    child: new Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 50.0,
            minWidth: double.infinity,
            minHeight: 50.0
          ),
          alignment: Alignment.center,
          child: new Text('MEMBER REGISTRATION', style: new TextStyle(color: Colors.white, fontSize: 20.0)),
          decoration: const BoxDecoration(
              color: Colors.red,
              border: const Border(
                  bottom: const BorderSide(width: 1.0, color: Colors.black54),
              )
          ),
        ),
        new Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: new Column(
            children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(5.0),
                  child: new RichText(
                    text: TextSpan(
                      children: <TextSpan> [
                        TextSpan(
                          style: new TextStyle(color: Colors.black54, fontSize: 20.0),
                          text: 'If you have already created your account through the ',
                        ),
                        TextSpan(
                          style: new TextStyle(color: Colors.red, fontSize: 20.0),
                          text: 'Careington Member Portal ',
                          recognizer: new TapGestureRecognizer()..onTap = () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new InAppBrowser("https://member.careington.com")))
                            // Following Line is commented due to issue on passing the data on Named Route
                            // Navigator.pushNamed(context, '/in-app-browser', arguments: <String, String> { "url": "https://member.careington.com"})
                          },
                        ),
                      ]
                    ),
                  )
                ),
              ],
            ),
        ),
        new Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black54,
              width: 1.0,
            )
          ),
          child: new Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'FIRST NAME',
                      counterText: '',
                      hintStyle: TextStyle(fontSize: 20.0),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22.0),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black45,
                    maxLength: 20,
                    maxLines: 1,
                  ),
                  )
                ),
              ],
            ),
        ),
        new Container(
          alignment: Alignment.center,
          // height: 50.0,
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black54,
              width: 1.0,
            )
          ),
          child: new Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'LAST NAME',
                      counterText: '',
                      hintStyle: TextStyle(fontSize: 20.0),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22.0),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black45,
                    maxLength: 20,
                    maxLines: 1,
                  ),
                  )
                ),
              ],
            ),
        ),
        new Container(
          alignment: Alignment.center,
          // height: 50.0,
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black54,
              width: 1.0,
            )
          ),
          child: new Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'MEMBER ID',
                      counterText: '',
                      hintStyle: TextStyle(fontSize: 20.0),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22.0),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black45,
                    maxLength: 20,
                    maxLines: 1,
                  ),
                  )
                ),
              ],
            ),
        ),
      ],
    )
  );
}
