import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:get/get.dart';

class SplashScreenController {
  String appVersion = '';

  SplashScreenController() {
    checkIfUserIsLogged();
  }

  void checkIfUserIsLogged() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(ROUTE_LOGIN);
  }
}
