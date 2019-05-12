import 'package:careington/src/common/progressbar.dart';
import 'package:careington/src/utils/common-service.dart';
import 'package:careington/src/utils/network-utils.dart';
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
  FocusNode _usernameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  //handler that we will use to show and hide widget
  ProgressBarHandler _handler;
  
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
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
                    body: body(_handler),
                    bottomNavigationBar: footer(context),
                  );
    var progressBar = ModalRoundedProgressBar(
      //getting the handler
      handleCallback: (handler) { _handler = handler;},
    );

    return Stack(
      children: <Widget>[
        scaffold,
        progressBar,
      ],
    ); 
  }

  void fetchPost(String uname, String pwd) {

    NetworkUtil _netUtil = new NetworkUtil();
    CommonService _commonService = new CommonService();

    _netUtil.post('Login', headers: {}, body: {
      "UserName": uname,
      "Password": pwd
    }).then((dynamic res) {
      // Handle Error
      if(res["error"] != null) {
        throw new Exception(res["error_msg"]);
      }
      // Handle Success
      if (res["Success"] == "true") {
        _commonService.setValue("LoginDetails", res);
        Navigator.pushNamed(context, '/member-home');
      }
      // Handle Failure
      if (res["Success"] == "false") {
      }
    });
  }

  // Body Widget
  Widget body(progress) {
    final loginBloc = LoginBloc();
    String username;
    String password;
    return new Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/bg.png'))),
      child: new Wrap(
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
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  username = snapshot.data;
                }
                return new TextField(
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
                  focusNode: _usernameFocusNode,
                  maxLines: 1,
                );
              }
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
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  password = snapshot.data;
                }
                return new TextField(
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
                  focusNode: _passwordFocusNode,
                );
              }
            )
          ),
          new Container(
            child: StreamBuilder<bool>(
              stream: loginBloc.submitCheck,
              builder: (context, snapshot) {
                return new MaterialButton(
                  minWidth: double.maxFinite,
                  height: 50.0,
                  child: new Text('LOGIN',
                      style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    _usernameFocusNode.unfocus();
                    _passwordFocusNode.unfocus(); 
                    if (username != null && password != null) {
                      progress.show();
                      fetchPost(username, password);
                    }
                  }
                );
              }
            ),
            decoration: const BoxDecoration(
                border: const Border(
                    bottom: const BorderSide(width: 1.0, color: Colors.black87),
                    top: const BorderSide(width: 1.0, color: Colors.black87)
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
}

