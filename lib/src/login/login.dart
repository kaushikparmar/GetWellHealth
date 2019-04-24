import 'package:flutter/material.dart';
import '../sidebar-navigation.dart';
import '../footer.dart';
import 'login-bloc.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {

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
      body: body(),
      bottomNavigationBar: footer(context),
    );
  }
}

// Body Widget
Widget body() {
  final loginBloc = LoginBloc();
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
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black54,
              width: 1.0,
            )
          ),
          child: StreamBuilder<String>(
            stream: loginBloc.username,
            builder: (context, snapshot) => new TextField(
                    onChanged: (str) => loginBloc.usernameChanged.add(str),
                    decoration: InputDecoration(
                      hintText: 'USERNAME',
                      counterText: '',
                      hintStyle: TextStyle(fontSize: 20.0),
                      border: InputBorder.none,
                      errorText: snapshot.error
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0, decoration: TextDecoration.none),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black45,
                    maxLines: 1,
                  ),
          )
        ),
        new Container(
          alignment: Alignment.center,
          // height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: StreamBuilder<String>(
            stream: loginBloc.password,
            builder: (context, snapshot) => new TextField(
                    onChanged: (str) => loginBloc.passwordChanged.add(str),
                    decoration: InputDecoration(
                      hintText: 'PASSWORD',
                      counterText: '',
                      hintStyle: TextStyle(fontSize: 20.0),
                      border: InputBorder.none,
                      errorText: snapshot.error
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    cursorColor: Colors.black45,
                    maxLines: 1,
                  ),
          )
        ),
        new Container(
          child: StreamBuilder<bool>(
            stream: loginBloc.submitCheck,
            builder: (context, snapshot) => new MaterialButton(
              minWidth: double.maxFinite,
              height: 50.0,
              child: new Text('LOGIN',
                  style: new TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () { 
                // print(snapshot.hasData);
                  // if (snapshot.hasData) {
                    loginBloc.fetchPost();
                  // }
                }
              ),
          ),
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 1.0, color: Colors.black54),
                  // top: const BorderSide(width: 1.0, color: Colors.black54)
              )
          ),
        ),
        new Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Switch(
                activeColor: Colors.red,
                value: false,
                onChanged: (bool val){
                  //
                },
              ),
              Text('Remember Username')
            ],
          )
        ),
      ],
    )
  );
}
