import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import 'app_remote_routes.dart';

class ApiProvider{
  late Dio _dio;

  ApiProvider() {
    _dio = Dio(
      BaseOptions(
        validateStatus: (status) {
          return true;
        },
        followRedirects: false,
        headers: {
          "access-control-allow-origin": "*",
          // "Access-Control-Allow-Origin": "*",
          // "Access-Control-Allow-Credentials": false,
          'Content-Type': 'application/json'
        },
        baseUrl: AppRemoteRoutes.baseUrl,
      ),
    );
    if (!kIsWeb) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  Future<Map<String, dynamic>> get(String endPoint) async {
    try {
      // GetStorage sr = GetStorage();
      // String? token = sr.read('token');
      // print(token);
      // _dio.options.headers.addAll({'Authorization': 'Token $token'});

      final Response response = await _dio.get(
        endPoint,
      );
      print(response);

      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      print(err);
      return {};
    }
  }

  Future<Map<String, dynamic>> post(
      String endPoint, Map<String, dynamic> body) async {
    print("on post call$body");
    try {
      print("starting dio");
      GetStorage sr = GetStorage();
      String? token = sr.read('token');
      print(token ?? "");
      if (token != null) {
        _dio.options.headers.addAll({'Authorization': 'Token $token'});
      }
      final Response response = await _dio.post(
        endPoint,
        data: body,
      );

      print("getting response$response");
      final Map<String, dynamic> responseData = classifyResponse(response);
      // prettyPrint(msg: responseData.toString());
      return responseData;
    } on DioError catch (err) {
      print(err.toString());
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> put(
      String endPoint, Map<String, dynamic> body) async {
    print("on post call");
    try {
      GetStorage sr = GetStorage();
      String? token = sr.read('token');
      print(token ?? "");
      _dio.options.headers.addAll({'Authorization': 'Token $token'});
      print("starting dio");
      final Response response = await _dio.put(
        endPoint,
        data: body,
      );
      print("getting response$response");
      final Map<String, dynamic> responseData = classifyResponse(response);
      // print(responseData);
      return responseData;
    } on DioError catch (err) {
      print(err);
      throw FetchDataException("internetError");
    }
  }



  Map<String, dynamic> classifyResponse(Response response) {
    // print(response);
    final Map<String, dynamic> responseData =
    response.data as Map<String, dynamic>;
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 400:
        throw BadRequestException(responseData.toString());
      case 401:
        throw UnauthorisedException(responseData.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
class CustomException implements Exception {
  final String? _prefix;

  CustomException([this._prefix]);

  @override
  String toString() {
    return _prefix.toString();
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message ?? "internetError");
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super(message ?? "internetError");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message]) : super(message ?? "internetError");
}