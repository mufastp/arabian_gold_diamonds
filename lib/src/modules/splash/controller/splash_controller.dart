import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _moveNext();
  }

  void _moveNext() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = box.read("token");

    if (token != null && token.toString().isNotEmpty) {
      Get.offAllNamed(Routes.verifyStep1); // logged in user
    } else {
      Get.offAllNamed(Routes.onboard); // first time or logged out
    }
  }
}
