import 'dart:developer';

import 'package:arabian_gold_diamonds/app/utils/network/api_urls.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioInterceptor extends Interceptor {
  final GetStorage _storage = GetStorage();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    bool isConnected = await _checkNetwork();
    if (!isConnected) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'No internet connection. Please check your network.',
        ),
      );
    }

    final token = _storage.read('token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    log('📤 Request 📤: ${options.method} ${options.uri}');
    log('☁️ Headers ☁️: ${options.headers}');
    if (options.data != null) log('📄 Request Body: ${options.data}');

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('✅ Respons ✅ : ${response.statusCode} ${response.data}');
   // print('✅ Respons ✅ : ${response.statusCode} ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('❌ Error: ${err.response?.statusCode} - ${err.message}');
    if (err.response != null) {
      log('🔗 Headers: ${err.response!.headers}');
      log('📄 Response Data: ${err.response!.data}');
    }

    if (err.response?.statusCode == 401) {
      log('🔄 Token expired. Refreshing token...');
      bool success = await _refreshToken();

      if (success) {
        return handler.resolve(await _retryRequest(err.requestOptions));
      } else {
        log('🚫 Token refresh failed. Logging out...');
        // Add logout navigation if needed
      }
    } else if (err.response?.statusCode == 400) {
      log(
        '❌ Bad Request: ${err.response?.data['message'] ?? "Invalid request"}',
      );
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final dio = Dio();
      final refreshToken = _storage.read('refresh_token');
      if (refreshToken == null) return false;

      final response = await dio.post(
        '${ApiUrls.baseURL}/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newToken = response.data['accessToken'];
        await _storage.write('auth_token', newToken);
        log('🔑 Token refreshed.');
        return true;
      }
    } catch (e) {
      log('🚨 Token refresh error: $e');
    }
    return false;
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final dio = Dio();
    final newToken = _storage.read('auth_token');

    if (newToken != null) {
      requestOptions.headers['Authorization'] = 'Bearer $newToken';
    }

    return await dio.fetch(requestOptions);
  }

  Future<bool> _checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}