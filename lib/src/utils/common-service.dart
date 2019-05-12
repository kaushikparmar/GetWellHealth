
class CommonService {
  var loginData = {};
  // next three lines makes this class a Singleton
  static CommonService _instance = new CommonService.internal();
  CommonService.internal();
  factory CommonService() => _instance;

  void setValue(dynamic key, dynamic value) {
    loginData[key] = value;
  }

  dynamic getValue(key) {
    return loginData[key];
  }
  
}