
import 'package:flutter/material.dart';

class ModalRoundedProgressBar extends StatefulWidget {
  final double _opacity;
  final String _textMessage; // optional message to show
   final Function _handlerCallback; // callback that will give a handler object to change widget state.

  ModalRoundedProgressBar({
    @required Function handleCallback(ProgressBarHandler handler),
    String message = "", // some text to show if needed...
    double opacity = 0.7, // opacity default value
  })  : _textMessage = message,
        _opacity = opacity,
        _handlerCallback = handleCallback;

  @override
  State createState() => _ModalRoundedProgressBarState();
}
//StateClass ...
class _ModalRoundedProgressBarState extends State<ModalRoundedProgressBar> {
  bool _isShowing = false; // member that control if a rounded progressBar will be showing or not

  @override
  void initState() {
    super.initState();
    /* Here we create a handle object that will be sent for a widget that creates a ModalRounded      ProgressBar.*/
    ProgressBarHandler handler = ProgressBarHandler();

   handler.show = this.show; // handler show member holds a show() method
    handler.dismiss = this.dismiss; // handler dismiss member holds a dismiss method
    widget._handlerCallback(handler); //callback to send handler object
  }

  @override
  Widget build(BuildContext context) {
    //return a simple stack if we don't wanna show a roundedProgressBar...
    if (!_isShowing) return Stack(); 

   // here we return a layout structre that show a roundedProgressBar with a simple text message
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: widget._opacity,
            //ModalBarried used to make a modal effect on screen
            child: ModalBarrier( 
              dismissible: false,
              color: Colors.black54,
            ),
          ),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Text(widget._textMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // method do change state and show our CircularProgressBar
  void show() {
    setState(() => _isShowing = true);
  }

 // method to change state and hide our CIrcularProgressBar
  void dismiss() {
    setState(() => _isShowing = false);
  }
}

// handler class
class ProgressBarHandler {
  Function show; //show is the name of member..can be what you want...
  Function dismiss;
}