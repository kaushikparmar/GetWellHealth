import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validators implements BaseBloc {
  // Create a stream controller
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get username => _usernameController.stream.transform(usernameValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck => Observable.combineLatest2(username, password, (e, p) => true);
  
  StreamSink<String> get usernameChanged => _usernameController.sink;
  StreamSink<String> get passwordChanged => _passwordController.sink;

  @override
  void dispose() {
    _usernameController?.close();
    _passwordController?.close();
  }

}

abstract class BaseBloc {
  void dispose();
}