
import 'dart:async';

mixin Validators {
  var usernameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (username, sink) {
      // Do not add to the sink if the value is invalid
      if (username.length > 20) {
        sink.addError('Username should not be more than 20 characters long.');
      } else if (!username.contains(new RegExp(r'[A-Z]'))) {
        sink.addError('Username should contain at least one capital letter.');
      } else if (!username.contains(new RegExp(r'[0-9]'))) {
        sink.addError('Username should contain at least one digit');
      } else {
        sink.add(username);
      }
    }
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 20) {
        sink.addError('Password should not be more than 20 characters long.');
      } else {
        sink.add(password);
      }
    }
  );
}