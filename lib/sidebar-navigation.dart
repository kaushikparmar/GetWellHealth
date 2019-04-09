import 'package:flutter/material.dart';


class SidebarNavigation extends StatefulWidget {
  final String currentRoute;

  SidebarNavigation(this.currentRoute);

  @override
  _SidebarNavigationState createState() => new _SidebarNavigationState(this.currentRoute);
}


class _SidebarNavigationState extends State<SidebarNavigation> {
  String currentRoute;

  _SidebarNavigationState(currentRoute);

  void _handleItemSelection() {
    setState(() {
      var RO = new RouteObserver();
      // RO.subscribe(this, ModalRoute.of(context));
      // debugPrint('RA ${ModalRoute.of(context).settings.name}');
      // debugPrint('RO ${widget.currentRoute}');
      Navigator.of(context).pop();
    });
  }

  Color _selectMenuTextColor(String menu) {
    if (menu == widget.currentRoute) {
      return Colors.white;
    } else {
      return Colors.red;
    }
  }

  Color _selectMenuBgColor(String menu) {
    if (menu == widget.currentRoute) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

 Widget build(BuildContext context) {
  //  debugPrint('RO ${widget.currentRoute}');
    return new Drawer(
        child: new ListView(
          children: <Widget>[
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('HOME', style: new TextStyle(color: _selectMenuTextColor('/home'), fontSize: 20.0, fontWeight: FontWeight.bold)),
              color: _selectMenuBgColor('/home'),
              onPressed: () {
                if (widget.currentRoute != '/home') {
                  this._handleItemSelection();
                  Navigator.pushNamed(context, '/home');
                }
              }
            ),
            decoration: const BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: const Border(
                    top: const BorderSide(width: 1.0, color: Colors.black54),
                    bottom: const BorderSide(width: 1.0, color: Colors.black54)
                  )
            ),
          ),
          new Container(
            child: new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('MEMBER LOGIN', style: new TextStyle(color: _selectMenuTextColor('/login'), fontSize: 20.0, fontWeight: FontWeight.bold)),
              color: _selectMenuBgColor('/login'),
              onPressed: () {
                if (widget.currentRoute != '/login') {
                  this._handleItemSelection();
                  Navigator.pushNamed(context, '/login');
                }
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
              child: new Text('FIND A PROVIDER', style: new TextStyle(color: _selectMenuTextColor('/find-a-provider'), fontSize: 20.0, fontWeight: FontWeight.bold)),
              color: _selectMenuBgColor('/find-a-provider'),
              onPressed: () {
                if (widget.currentRoute != '/find-a-provider') {
                  this._handleItemSelection();
                  Navigator.pushNamed(context, '/find-a-provider');
                }
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
}