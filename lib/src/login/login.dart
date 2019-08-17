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
  // Login Bloc
  final loginBloc = LoginBloc();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();  

  // Handle Focus Node
  FocusNode _usernameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  // Network Service
  NetworkUtil _netUtil = new NetworkUtil();
  // Common Service
  CommonService _commonService = new CommonService();
  //handler that we will use to show and hide widget
  ProgressBarHandler _handler;
  // Is Remember Me
  bool isRememberMe = false;
  
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
                    body: body(context),
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

  @override
  void initState() {
    super.initState();
    setState(() {
      CommonService _commonService = new CommonService();
      bool checkRememberMe = _commonService.getValue('isRememberMe');
      if (checkRememberMe == true) {
        isRememberMe = _commonService.getValue('isRememberMe');
        usernameController.text = _commonService.getValue('Username');
      }
    });
  }

  void fetchPost(String uname, String pwd) {
    _handler.show();
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
        // Set LoginDetails
        _commonService.setValue("LoginDetails", res);
        // Redirect to member home        
        Navigator.pushNamed(context, '/member-home');
      }
      // Handle Failure
      if (res["Success"] == "false") {
      }
      _handler.dismiss();
    });
  }

  // Body Widget
  Widget body(context) {
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
                return new TextField(
                  onChanged: (str) => loginBloc.usernameChanged.add(str),
                  decoration: InputDecoration(
                    hintText: 'USERNAME',
                    counterText: '',
                    hintStyle: TextStyle(fontSize: 20.0),
                    border: InputBorder.none,
                    errorText: snapshot.error
                  ),
                  controller: usernameController,
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
                return new TextField(
                  onChanged: (str) => loginBloc.passwordChanged.add(str),
                  decoration: InputDecoration(
                    hintText: 'PASSWORD',
                    counterText: '',
                    hintStyle: TextStyle(fontSize: 20.0),
                    border: InputBorder.none,
                    errorText: snapshot.error
                  ),
                  controller: passwordController,
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
                    if (usernameController.text != null && passwordController.text != null) {
                      fetchPost(usernameController.text, passwordController.text);
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
                  value: isRememberMe,
                  onChanged: (bool val){
                    if (val) {
                      setState(() {
                        isRememberMe = val; 
                      });
                      // Set Remember Me
                      _commonService.setValue('isRememberMe', val);
                      // Set Username
                      _commonService.setValue('Username', usernameController.text);
                    }
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

