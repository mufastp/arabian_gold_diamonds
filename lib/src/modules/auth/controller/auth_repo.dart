import 'dart:convert';

import 'package:arabian_gold_diamonds/app/utils/dio/dio_client.dart';
import 'package:arabian_gold_diamonds/app/utils/network/api_urls.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/model/loginmodel.dart';

class AuthRepository {
  final DioClient _dioClient = DioClient();

  // 🔹 LOGIN
  Future<Loginmmodel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.post(
      ApiUrls.login,
      body: {"email": email.trim(), "password": password.trim()},
    );

    return loginmmodelFromJson(jsonEncode(response.data));
  }

  // 🔹 SIGNUP
 // 🔹 SIGNUP
Future<bool> signup({
  required String email,
  required String password,
}) async {
  try {
    final response = await _dioClient.post(
      ApiUrls.sign,
      body: {
        "userName": "string",
        "email": email.trim(),
        "password": password.trim(),
        "role": "string",
        "providerUserId": "",
        "mobileNo": "",
      },
    );

    // CHECK SUCCESS STATUS CODES
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true; // SUCCESS
    } else {
      return false; // FAILED
    }
  } catch (e) {
    // NETWORK ERROR OR SERVER ERROR
    return false;
  }
}

}
