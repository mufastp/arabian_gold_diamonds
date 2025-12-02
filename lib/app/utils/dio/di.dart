
import 'package:arabian_gold_diamonds/app/utils/dio/dio_client.dart';
import 'package:get/instance_manager.dart';



class DI {
  static inject() {
    Get.lazyPut(() => DioClient());
  }
}
