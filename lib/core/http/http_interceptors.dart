import 'package:dio/dio.dart';

import 'http_response_data.dart';

/// 拦截器
class HttpInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 请求前对接口处理
    options.copyWith(
      headers: {
        'Content-Type': 'application/json',
      },
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 请求成功是对数据做基本处理
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      response.data =
          HttpResponseData(code: response.data['code'], message: response.data['message'] ?? "success", data: response.data, result: true);
    } else {
      response.data =
          HttpResponseData(code: response.data['code'], message: response.data['message'] ?? "fail", data: response.data, result: false);
    }

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        print('网络连接超时，请检查网络设置');
        break;
      case DioErrorType.sendTimeout:
        print('网络连接超时，请检查网络设置');
        break;
      case DioErrorType.receiveTimeout:
        print('服务器异常，请稍后重试');
        break;
      case DioErrorType.response:
        print('服务器异常，请稍后重试');
        break;
      case DioErrorType.cancel:
        print('请求已被取消，请重新请求');
        break;
      case DioErrorType.other:
        print('网络异常，请稍后重试');
        break;
      default:
        print('未知错误');
        break;
    }
    print(err.response);
    super.onError(err, handler);
  }
}
