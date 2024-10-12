import 'package:dio/dio.dart';

class DioSetting {
  final Dio dio;

  DioSetting()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://rickandmortyapi.com/api/',
            connectTimeout: const Duration(milliseconds: 3000),
            sendTimeout: const Duration(milliseconds: 3000),
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('Request: ${options.method}, ${options.path}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print('Response: ${response.statusCode}, ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          print('Error: ${error.error}, ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }
}
