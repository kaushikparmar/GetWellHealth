import 'package:flutter/material.dart';
import '../sidebar-navigation.dart';
import '../footer.dart';
import 'package:careington/src/utils/common-service.dart';

class MemberHome extends StatefulWidget {
  MemberHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MemberHome createState() => new _MemberHome();
}

class _MemberHome extends State<MemberHome> {
  String memberName;

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

  @override
  void initState() {
    super.initState();
    setState(() {
      CommonService _commonService = new CommonService();
      var userDetails = _commonService.getValue("LoginDetails");
      memberName = userDetails["FirstName"] + ' ' + userDetails["LastName"];
    });
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
            // height: 80.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  new Container(
                    child: new Text('WELCOME', style: new TextStyle(color: Colors.red, fontSize: 25.0, fontWeight: FontWeight.bold)),
                    margin: EdgeInsets.all(8.0),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    child: new Text(memberName, textAlign: TextAlign.center, style: new TextStyle(color: Colors.black54, fontSize: 20.0))
                  ),
                ],
              ),
          ),
          new Container(
            child: new MaterialButton(
                minWidth: double.maxFinite,
                height: 50.0,
                child: new Text('MY ID CARDS',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                Navigator.pushNamed(context, '/member-id-cards'); 
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
                child: new Text('FIND A PROVIDER',
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
}
