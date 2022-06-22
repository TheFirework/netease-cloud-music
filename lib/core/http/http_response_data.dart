import 'dart:convert';

class HttpResponseData<T> {
  /// 响应数据
  T? data;

  /// 自定义code
  int code;

  bool result;

  /// 消息
  String? message;

  HttpResponseData({
    this.data,
    required this.result,
    required this.code,
    this.message,
  });

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
