import 'dart:io';
import 'dart:convert';
import 'package:pintando_carro/shared/constants.dart';
import 'package:dio/dio.dart';

class DioRequest {
  final Dio dio = Dio();

  DioRequest() {
    dio.options.baseUrl = BASE_URL;
    dio.options.sendTimeout = 15000;
    dio.options.headers = <String, String>{
      "Content-Type": "application/json",
      HttpHeaders.authorizationHeader: 'Basic ' +
          base64Encode(
            utf8.encode('Admin:$REQUEST_KEY'),
          ),
    };
  }
}
