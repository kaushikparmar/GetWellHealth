import 'package:flutter/material.dart';

Widget footer(context) {
  return new Container(
    height: 55.0,
    decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        border: const Border(
            top: const BorderSide(width: 1.0, color: Colors.black54))),
    alignment: Alignment.center,
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
            child: new MaterialButton(
              child: new Image.asset('assets/images/home-red.png', height: 35.0),
              onPressed: () { 
                  Navigator.pushNamed(context, '/home');
              },
            )
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
            child: new MaterialButton(
              child: new Image.asset('assets/images/back.png', height: 35.0),
              onPressed: () { 
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            )
          )
      ],
    ),
  );
}
