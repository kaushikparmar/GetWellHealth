import 'dart:developer';
import 'dart:async';
import 'validators.dart';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import '../environment/environment.dart';
import 'package:dio/dio.dart';

class LoginBloc extends Object with Validators implements BaseBloc {
  // Create a stream controller
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get username => _usernameController.stream.transform(usernameValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck => Observable.combineLatest2(username, password, (e, p) => true);
  
  StreamSink<String> get usernameChanged => _usernameController.sink;
  StreamSink<String> get passwordChanged => _passwordController.sink;


  void submit() {
    //
  }

  void fetchPost() async {
    // Set default configs
    BaseOptions options = new BaseOptions(
        baseUrl: environmentURL,
        connectTimeout: 10000,
        receiveTimeout: 5000,
        responseType: ResponseType.json
    );
    Dio dio = new Dio(options);
    print('in fetchPost');
    final params = {
      'UserName': username,
      'Password': password
    };

    // Map<String, String> requestHeaders = {
    //   "Accept": "application/json"
    // };

    try {
      Response response = await dio.post(
        '/Login',
        data: json.encode(params)
      );
      print(response);
            debugger();
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        print('LoginResponse');
        print(response.data);
        // return response.body;
      } 
    }
    catch(e) {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void dispose() {
    _usernameController?.close();
    _passwordController?.close();
  }

}

abstract class BaseBloc {
  void dispose();
}