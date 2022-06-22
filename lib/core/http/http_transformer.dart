
import 'package:dio/dio.dart';

class HttpTransformer extends DefaultTransformer{
  @override
  Future<String> transformRequest(RequestOptions options) {
    // TODO: implement transformRequest
    return super.transformRequest(options);
  }

  @override
  Future transformResponse(RequestOptions options, ResponseBody response) {
    // TODO: implement transformResponse
    return super.transformResponse(options, response);
  }
}