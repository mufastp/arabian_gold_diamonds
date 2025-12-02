
import 'dart:developer';

import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/src/core/appsnakbar.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DioExceptionHandler {
  static String handleException(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "⏳ Connection timeout. Please try again.";
        case DioExceptionType.sendTimeout:
          return "⚠️ Request timeout. Please try again.";
        case DioExceptionType.receiveTimeout:
          return "⏳ Server response timeout.";
        case DioExceptionType.badResponse:
          return _handleBadResponse(error);
        case DioExceptionType.cancel:
          return "🚫 Request cancelled.";
        case DioExceptionType.connectionError:
          return "❌ No internet connection.";
        case DioExceptionType.unknown:
        default:
          return "⚠️ Unexpected error occurred.";
      }
    } else {
      return _handleNonDioError(error);
    }
  }

  static String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    // ✅ Automatically handle auth/session errors
    if (statusCode != null && statusCode >= 400) {
      handleUnauthorized(); // defined separately
    }

    String message = "Unknown server error.";

    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }

      if (data.containsKey('errors') && data['errors'] is List) {
        final errorsList = data['errors'] as List;
        final detailedErrors = errorsList
            .map(
              (e) => e.entries
                  .map((entry) => "${entry.key}: ${entry.value}")
                  .join('\n'),
            )
            .join('\n');
        message += "\n$detailedErrors";
      }
    } else if (data is String && !data.toLowerCase().contains('<html')) {
      message = data;
    } else {
      message = _messageFromStatusCode(statusCode);
    }

    return "⚠️ HTTP $statusCode: $message";
  }

  static String _messageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized. Please login again.";
      case 403:
        return "Forbidden. You don't have permission.";
      case 404:
        return "Resource not found.";
      case 500:
        return "Internal server error. Please try later.";
      case 503:
        return "Service unavailable. Please try later.";
      case 422:
      default:
        return "The request was well-formed but had semantic errors.";
    }
  }

  static String _handleNonDioError(dynamic error) {
    if (error is String && error.contains("HTTP")) {
      RegExp regExp = RegExp(r"HTTP \d+:\s*(.*)");
      var match = regExp.firstMatch(error);
      return match?.group(1) ?? error;
    }

    if (error is String) return error;
    log("Unexpected error: ${error.toString()}");
    return error.toString();
  }

  static Future<bool> checkNetworkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<String> getNetworkErrorMessage() async {
    return await checkNetworkConnectivity() ? "" : "📴 No internet connection.";
  }
}

Future<void> handleUnauthorized() async {
  await GetStorage().erase();
  Get.toNamed(Routes.splash,);
  TcSnackbar.error('Session Expired', 'Please log in again.');
}