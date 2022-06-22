class Config {
  /// 请求基地址
  static const String baseUrl = 'https://netease-cloud-music-api-chi-drab.vercel.app';
  /// Http请求头.
  static const Map<String, dynamic> headers = {};
  /// 连接服务器超时时间，单位是毫秒.
  static const int connectTimeout = 10000;
  static const int receiveTimeout = 10000;
  /// 请求的Content-Type
  static const contentType = 'application/json; charset=utf-8';
}