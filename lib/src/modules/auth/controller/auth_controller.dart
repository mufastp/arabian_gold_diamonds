import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/app/utils/dio/dio_exception.dart';
import 'package:arabian_gold_diamonds/src/core/appsnakbar.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/controller/auth_repo.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/model/loginmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthRepository _repo = AuthRepository();
  final storage = GetStorage(); // ✅ Storage instance
  var loginResponse = Rxn<Loginmmodel>();

  var isLoading = false.obs;
  var errorMessage = "".obs;

  // -------------------------------
  // 🔹 LOGIN FUNCTION
  // -------------------------------
  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final result = await _repo.login(email: email, password: password);

      if (result != null && result.data?.accessToken != null) {
        /// SAVE API RESPONSE
        loginResponse.value = result;

        /// SAVE TOKEN
        storage.write("token", result.data?.accessToken);

        /// SAVE USER
        storage.write("user", result.data?.user);

        /// STOP LOADING
        isLoading.value = false;

        /// NAVIGATE TO LANDING/HOME
        if (result.data?.user?.kycStatus=="Not Submitted") {
            Get.offAllNamed(Routes.verifyStep1);
        } else {
            Get.offAllNamed(Routes.homescreen);
        }
       

        /// SUCCESS TOAST
        TcSnackbar.success(
          "Login Successful",
          result.message ?? "Welcome Back!",
        );
      } else {
        /// API returned error
        isLoading.value = false;

        errorMessage.value = result.message ?? "Login failed";

        TcSnackbar.error("Login Failed", errorMessage.value);
      }
    } catch (e) {
      /// EXCEPTION
      errorMessage.value = DioExceptionHandler.handleException(e);

      TcSnackbar.error("Login Failed", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // -------------------------------
  // 🔹 SIGNUP FUNCTION
  // -------------------------------
  Future<void> signup(String email, String password) async {
    try {
      isLoading.value = true;

      final success = await _repo.signup(email: email, password: password);

      if (success) {
        Get.snackbar("Success", "Account created successfully.");
        Get.offAllNamed(Routes.loginscreen);
      } else {
        Get.snackbar("Signup Failed", "Something went wrong.");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // -------------------------------
  // 🔹 Check login state
  // -------------------------------
  bool isLoggedIn() {
    return storage.hasData("token");
  }

  // -------------------------------
  // 🔹 Logout
  // -------------------------------
  void logout() {
    storage.erase(); // Clears all stored data
    Get.offAllNamed(Routes.startpage);
  }
}
