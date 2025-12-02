import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  static Future<bool> hasInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
