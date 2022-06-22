import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/core/config/index.dart';
import 'package:netease_cloud_music/core/cookie/cookie.dart';

import 'http_interceptors.dart';
import 'http_response_data.dart';
import 'http_transformer.dart';

class Http {
  static final Http _instance = Http._internal();
  factory Http() => _instance;
  late Dio dio;
  final CancelToken _cancelToken = CancelToken();

  Http._internal();

  init() async {
    /// 初始化
    BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: Config.connectTimeout,
      receiveTimeout: Config.receiveTimeout,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
      followRedirects: false,
      validateStatus: (status){
        return status! < 500;
      }
    );

    dio = Dio(options);
    // 转换器
    dio.transformer = HttpTransformer();
    // cookie 管理器
    dio.interceptors.add(CookieManager(await CookieCore.cookieJar));
    // 拦截器
    dio.interceptors.add(HttpInterceptors());
  }

  Future<HttpResponseData> request<T>({
    BuildContext? context,
    required String url,
    String method = "GET",
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    // 检测网络
    options = Options(method: method, headers: headers);
    Response response;
    try {
      response = await dio.request(
        url,
        queryParameters: params,
        data: data,
        options: options,
        cancelToken: cancelToken ?? _cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response.data;
    } on DioError catch (e) {
      print('Net Error : ${e}');
      return Future.error(Response(data: -1,requestOptions: e.requestOptions));
    }
  }

  /// 设置Http代理
  void setProxy({String? proxyAddress, bool enable = false}) {
    if (enable) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.findProxy = (uri) {
          return proxyAddress ?? "";
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  /// 设置https证书校验
  void setHttpsCertificateVerification({String? pem, bool enable = false}) {
    if (enable) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == pem) {
            // 验证证书
            return true;
          }
          return false;
        };
      };
    }
  }

  /// 开启日志打印
  void openLog() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  /// 取消网络请求
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }
}
