import 'package:flutter/material.dart';
import '../sidebar-navigation.dart';
import '../footer.dart';
import 'package:careington/src/utils/common-service.dart';
import 'package:careington/src/common/progressbar.dart';
import 'package:careington/src/utils/network-utils.dart';

class MemberIDCards extends StatefulWidget {
  MemberIDCards({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MemberIDCards createState() => new _MemberIDCards();
}

class _MemberIDCards extends State<MemberIDCards> {
  String memberName;
  var userDetails;
  ProgressBarHandler progressHandler;
  final pageController = PageController(
    initialPage: 0
  );

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
      handleCallback: (handler) { progressHandler = handler;},
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
    init();
  }

  void init() {
    // check if multiple available plans found
    CommonService _commonService = new CommonService();
    userDetails = _commonService.getValue('LoginDetails');
    if (userDetails['Result'][0]['AvailablePlans'].length == 1) {
      _commonService.setValue('selectedPlan', userDetails['Result'][0]['AvailablePlans'][0]);
      // showMultipleSelectionDialog(context, userDetails['Result'][0]['AvailablePlans']);
      //this.getDataAccordingToZipCode(this.zipcode);
    } else if (userDetails['Result'][0]['AvailablePlans'].length > 1) {
      // let selectPlan = this.modalCtrl.create('MultiplePlansPage', {'AvailablePlans': this.userDetails.Result[0]['AvailablePlans']}, {showBackdrop: false, enableBackdropDismiss:false});
      // selectPlan.present();
      // selectPlan.onDidDismiss(
      //   (selectedPlan) => {
      //     if (selectedPlan !== undefined) {
      //       this.userService.set('selectedPlan', selectedPlan);
      //       this.getDataAccordingToZipCode(this.zipcode);
      //     } else {
      //       selectPlan.present();
      //     }
      //   }
      // );
      showMultipleSelectionDialog(context, userDetails.Result[0]['AvailablePlans']);
    } else {
      // this.getDataAccordingToZipCode(this.zipcode);
    }
  }

  Future<bool> showMultipleSelectionDialog(context, plans) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(),
          child: Container(
            height: 350.0,
            width: 200.0,
            child: Column(),
          ),
        );
      }
    );
  }

  void getMemberIDCards(String uname, String pwd) {

    NetworkUtil _netUtil = new NetworkUtil();
    CommonService _commonService = new CommonService();
    progressHandler.show();
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
  Widget body(context) {
    return new Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          new Text('Page 1'),
          new Text('Page 2'),
          new Text('Page 3')
        ],
      ),
    );
  }
}
