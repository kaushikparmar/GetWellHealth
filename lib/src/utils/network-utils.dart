import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:careington/src/environment/environment.dart';
import 'package:careington/src/utils/common-service.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();
  // Common Service
  CommonService _commonService = new CommonService();

  Future<dynamic> get(String api) {
    return http.get('$environmentURL/$api').then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String api, {Map headers, body, encoding}) {
    // Compulsory Headers
    var requestHeaders = {
      "Accept": "application/json",
      "x-api-key": "Q2FyZUFQSVNlcnZpY2VzOkphbjIwMTg="
    };
    // Add more headers
    if (headers.isNotEmpty) {
      requestHeaders.addAll(headers);
    }
    String checkAccessToken = _commonService.getValue('accesstoken');
    if (checkAccessToken != null && checkAccessToken.isNotEmpty) {
      requestHeaders['Authorization'] = _commonService.getValue('accesstoken');
    }
    return http
        .post('$environmentURL/$api', body: body, headers: requestHeaders, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (response.headers.containsKey('accesstoken')) {
        _commonService.setValue('accesstoken', response.headers['accesstoken']);
      }

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}