/// 配置项

class HttpConfig {
  final String baseUrl;
  final int? connectTimeout;
  final int? receiveTimeout;
  final int? sendTimeout;
  final String? cookiesPath;
  Map<String,dynamic>? header;

  HttpConfig({
    required this.baseUrl,
    this.connectTimeout = Duration.millisecondsPerMinute,
    this.receiveTimeout = Duration.millisecondsPerMinute,
    this.sendTimeout = Duration.millisecondsPerMinute,
    this.cookiesPath,
    this.header,
  });
}
