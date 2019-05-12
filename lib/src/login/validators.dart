import 'dart:async';

mixin Validators {
  var usernameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String username, EventSink<String> sink) {
      // Do not add to the sink if the value is invalid
      if (username.length > 20) {
        sink.addError('Username should not be more than 20 characters long.');
      } else {
        sink.add(username);
      }
    }
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, EventSink<String> sink) {
      if (password.length > 20) {
        sink.addError('Password should not be more than 20 characters long.');
      } else {
        sink.add(password);
      }
    }
  );
}