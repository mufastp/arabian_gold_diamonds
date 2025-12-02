import 'package:arabian_gold_diamonds/src/modules/auth/view/login_view.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/view/signup_view.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/view/start_view.dart';
import 'package:arabian_gold_diamonds/src/modules/homescreen/homescreen.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/verify_step1.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/verify_step2.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/verify_step3.dart';
import 'package:arabian_gold_diamonds/src/modules/onboarding/view/onboarding_screen.dart';
import 'package:arabian_gold_diamonds/src/modules/splash/view/splash_screen.dart';
import 'package:get/get.dart';


// Auth


class Routes {
  static const splash = '/';
  static const onboard = '/onboard1';
  static const startpage = '/startView';
  static const loginscreen = '/loginscreen';
  static const signup = '/signup';
  static const verifyStep1 = '/VerifyStep1';
  static const verifyStep2 = '/VerifyStep2';
  static const verifyStep3 = '/VerifyStep3';
  static const homescreen = '/Homescreen';
  


}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => SplashView()),
    GetPage(name: Routes.onboard, page: () => OnboardingView()),
    GetPage(name: Routes.startpage, page: () => StartView()),
    GetPage(name: Routes.loginscreen, page: () => LoginView()),
    GetPage(name: Routes.signup, page: () => SignupView()),
    GetPage(name: Routes.verifyStep1, page: () => VerifyStep1()),
    GetPage(name: Routes.verifyStep2, page: () => VerifyStep2()),
    GetPage(name: Routes.verifyStep3, page: () => VerifyStep3()),
    GetPage(name: Routes.homescreen, page: () => HomeScreeen()),
  
    // GetPage(name: Routes.LOGIN, page: () => LoginView()),
    // GetPage(name: Routes.SIGNUP, page: () => SignupView()),
    // GetPage(name: Routes.HOME, page: () => HomeView()),
  ];
}
