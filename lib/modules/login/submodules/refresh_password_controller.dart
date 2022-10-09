import 'package:pintando_carro/modules/login/repositories/login_repository.dart';
import 'package:pintando_carro/shared/components/modal_feedback.dart';
import 'package:pintando_carro/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RefreshPasswordController extends GetxController {
  var isLoading = false.obs;
  var passVisible = false.obs;
  var confirmPassVisible = false.obs;

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  refreshPassword(
      {required BuildContext context, required String email}) async {
    if (passController.text.isEmpty) {
      await ModalFeedBack.show(
          context: context,
          text: 'Informe a nova senha de acesso',
          isSuccess: false);
      return;
    }

    if (passController.text.length < 6) {
      await ModalFeedBack.show(
          context: context,
          text: 'A senha precisa ter no mínimo 6 carácteres',
          isSuccess: false);
      return;
    }

    if (passController.text != confirmPassController.text) {
      await ModalFeedBack.show(
          context: context,
          text: 'As senhas informadas não batem',
          isSuccess: false);
      return;
    }

    if (isLoading.value) {
      return;
    }

    isLoading.value = true;
    var success = await LoginRepository.refreshPassword(
        email: email, newPassword: passController.text);
    if (success == null) {
      await ModalFeedBack.show(
          context: context,
          text:
              'Ops! Tivemos um problema ao tentar atualizar a sua senha. Por favor tente novamente',
          isSuccess: false);
      isLoading.value = false;
      return;
    } else {
      if (success.success!) {
        await ModalFeedBack.show(
            context: context,
            text: 'A sua nova senha foi atualizada com sucesso!',
            isSuccess: true);
        Get.offAllNamed(ROUTE_HOME);
        isLoading.value = false;
        return;
      } else {
        await ModalFeedBack.show(
            context: context, text: success.message!, isSuccess: false);
      }
    }
    isLoading.value = false;
  }
}
