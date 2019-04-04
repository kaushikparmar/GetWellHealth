import 'package:flutter/material.dart';


class SidebarNavigation extends StatefulWidget {
  @override
  _SidebarNavigationState createState() => new _SidebarNavigationState();
}


class _SidebarNavigationState extends State<SidebarNavigation> {
  String currentRoute = '';
  void _handleItemSelection() {
    setState(() {
      var RO = new RouteObserver();
      // RO.subscribe(routeAware, route)
    });
  }

 Widget navigationDrawer(BuildContext context) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('HOME', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/home');
                this._handleItemSelection();
              }
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black54))),
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
                          width: 1.0, color: Colors.black54))),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('FIND A PROVIDER', style: new TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/find-a-provider');
              }
            ),
            decoration: const BoxDecoration(
                  border: const Border(
                      bottom: const BorderSide(
                          width: 1.0, color: Colors.black54))),
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
                          width: 1.0, color: Colors.black54))),
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
                          width: 1.0, color: Colors.black54))),
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
                          width: 1.0, color: Colors.black54))),
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
                          width: 1.0, color: Colors.black54))),
          )
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}