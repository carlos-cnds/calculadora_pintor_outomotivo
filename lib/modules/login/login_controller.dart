import 'package:calculadora_pintor_automotivo/models/user.dart';
import 'package:calculadora_pintor_automotivo/modules/login/repositories/login_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/components/modal_feedback.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/user_local_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final String email;
  var passVisible = false.obs;
  LoginController({required this.email}) {
    emailController = TextEditingController(text: email);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var isLoading = false.obs;

  resetPassword({required BuildContext context}) async {
    if (isLoading.value) {
      return;
    }
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = true;
    var success =
        await LoginRepository.resetPassword(email: emailController.text);

    if (success == null) {
      Fluttertoast.showToast(
          msg:
              'Ops! Tivemos um problema ao tentar resetar a sua senha. Por favor tente novamente',
          backgroundColor: Color(0xffcc2200),
          toastLength: Toast.LENGTH_LONG);
      isLoading.value = false;
    } else {
      if (success.success!) {
        Fluttertoast.showToast(
            msg: 'Enviamos a senha temporária para seu e-mail.',
            toastLength: Toast.LENGTH_LONG);
      } else {
        Fluttertoast.showToast(
            msg: success.message!,
            backgroundColor: Color(0xffcc2200),
            toastLength: Toast.LENGTH_LONG);
      }
    }
    isLoading.value = false;
  }

  login(BuildContext context) async {
    if (isLoading.value) {
      return;
    }
    isLoading.value = true;
    var success = await LoginRepository.login(
        email: emailController.text, password: passController.text);
    if (success == null) {
      await ModalFeedBack.show(
          context: context,
          text:
              'Houve um problema ao tentar fazer login. Por favor tente novamente mais tarde',
          isSuccess: false);
    } else {
      if (success['err_code'] != null) {
        // usuário não verificado, deve ir pra tela de verificação
        if (success['err_code'] == '0001') {
          Get.toNamed(ROUTE_RGISTER_CODE, arguments: {
            'email': emailController.text,
            'routeOnSubmitted': ROUTE_HOME
          });
          return;
        } else if (success['err_code'] == '0002') {
          Get.toNamed(ROUTE_REFRESH_PASSWORD,
              arguments: {'email': emailController.text});
        } else {
          await ModalFeedBack.show(
              context: context,
              text: success['success'].message,
              isSuccess: false);
          isLoading.value = false;
          return;
        }
      }
      if (success['success'].success) {
        UserLocalRepository.setUser(user: success['user']);
        Get.offAllNamed(ROUTE_HOME);
      } else {
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }
}
