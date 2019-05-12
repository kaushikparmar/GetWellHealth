import 'package:flutter/material.dart';
import 'sidebar-navigation.dart';
import 'footer.dart';

class CurrentProspectiveMember extends StatefulWidget {
  CurrentProspectiveMember({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CurrentProspectiveMember createState() => new _CurrentProspectiveMember();
}

class _CurrentProspectiveMember extends State<CurrentProspectiveMember> {

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
                  alignment: Alignment.center,
                  child: new Text('If you are a current member have your member ID number ready.', textAlign: TextAlign.center, style: new TextStyle(color: Colors.black87, fontSize: 20.0))
                ),
              ],
            ),
        ),
        new Container(
          child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('CURRENT MEMBER',
                  style: new TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
               Navigator.pushNamed(context, '/login'); 
              }),
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 1.0, color: Colors.black54),
                  // top: const BorderSide(width: 1.0, color: Colors.black54)
              )
          ),
        ),
        new Container(
          child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('PROSPECTIVE MEMBER',
                  style: new TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/find-a-provider');
              }),
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
