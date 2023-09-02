
import 'package:dio/dio.dart';

class BackendApi {
  late final Dio _dio;

  BackendApi() {
    _dio = Dio(BaseOptions(
        baseUrl: 'http://localhost:3000',
        contentType: 'application/json'));
  }

  Future<dynamic> getUserDetails(Map<String, String> map, 
      {Map<String, dynamic> body = const {}}) async {
    final response = await _dio.post('/user/getUserDetails', data: body);
    return response.data;
  }

  
}
