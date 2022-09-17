import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/user_local_repository.dart';
import 'package:get/get.dart';

class SplashScreenController {
  String appVersion = '';

  SplashScreenController() {
    checkIfUserIsLogged();
  }

  void checkIfUserIsLogged() async {
    await Future.delayed(Duration(seconds: 2));
    var user = UserLocalRepository.getUser();
    if (user == null) {
      Get.offNamed(ROUTE_LOGIN);
    } else {
      Get.offNamed(ROUTE_HOME);
    }
  }
}
