import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

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

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


// Body Widget
Widget body(context) {
  return new Container(
    child: new ListView(
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
                          style: new TextStyle(color: Colors.black54, fontSize: 15.0),
                          text: 'If you have already created your account through the ',
                        ),
                        TextSpan(
                          style: new TextStyle(color: Colors.red, fontSize: 15.0),
                          text: 'Careington Member Portal ',
                          recognizer: new TapGestureRecognizer()..onTap = () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new InAppBrowser("https://member.careington.com")))
                            // Following Line is commented due to issue on passing the data on Named Route
                            // Navigator.pushNamed(context, '/in-app-browser', arguments: <String, String> { "url": "https://member.careington.com"})
                          },
                        ),
                        TextSpan(
                          style: new TextStyle(color: Colors.black54, fontSize: 15.0),
                          text: ', please use your account information to log in. \n\nIf you have not created your account yet, please enter your information below to create your account. Your member ID will be printed on your fulfillment kit and your member ID Card.',
                        ),
                        TextSpan(
                          style: new TextStyle(color: Colors.black54, fontSize: 15.0),
                          text: '\n\nIf you’re unable to find your member ID, please call Member Services at ',
                        ),
                        TextSpan(
                          style: new TextStyle(color: Colors.red, fontSize: 15.0),
                          text: '(800) 290-0523',
                          recognizer: new TapGestureRecognizer()..onTap = () => {
                            // Open Phone Dialer
                            _launchURL("tel:(800) 290-0523")
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: new DropdownButton<String>(
                      hint: Text('STATE',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    )
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: new TextFormField(
                      decoration: InputDecoration(
                        hintText: 'ZIP CODE',
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
