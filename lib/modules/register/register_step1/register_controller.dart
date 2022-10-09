import 'package:pintando_carro/modules/register/repositories/register_repository.dart';
import 'package:pintando_carro/shared/components/modal_feedback.dart';
import 'package:pintando_carro/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterController extends GetxController {
  var passVisible = false.obs;
  var confirmPassVisible = false.obs;
  var checkPolitics = false.obs;
  var isLoading = false.obs;

  final BuildContext context;

  RegisterController({required this.context});

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool validateFields() {
    if (nameController.text.isEmpty) {
      ModalFeedBack.show(
          context: context, text: 'Informe seu nome', isSuccess: false);
      return false;
    } else if (nameController.text.length <= 3) {
      ModalFeedBack.show(
          context: context, text: 'Nome muito pequeno', isSuccess: false);
      return false;
    } else if (emailController.text.isEmpty) {
      ModalFeedBack.show(
          context: context, text: 'Informe seu e-mail', isSuccess: false);
      return false;
    } else if (!emailController.text.contains('@') ||
        !emailController.text.contains('.')) {
      ModalFeedBack.show(
          context: context, text: 'E-mail incorreto', isSuccess: false);
      return false;
    } else if (phoneController.text.isEmpty) {
      ModalFeedBack.show(
          context: context, text: 'Informe seu telefone', isSuccess: false);
      return false;
    } else if (passController.text.isEmpty) {
      ModalFeedBack.show(
          context: context,
          text: 'Informe a senha de acesso',
          isSuccess: false);
      return false;
    } else if (passController.text.length < 6) {
      ModalFeedBack.show(
          context: context,
          text: 'A senha precisa ter 6 ou mais carácteres',
          isSuccess: false);
      return false;
    } else if (passController.text != confirmPassController.text) {
      ModalFeedBack.show(
          context: context, text: 'As senhas não conferem!', isSuccess: false);
      return false;
    } else if (checkPolitics.value == false) {
      ModalFeedBack.show(
          context: context,
          text: 'É necessário aceitar o termos de uso do app!',
          isSuccess: false);
      return false;
    } else {
      return true;
    }
  }

  void sendForm() async {
    if (validateFields()) {
      isLoading.value = true;
      var success = await RegisterRepository.createUser(
          email: emailController.text,
          name: nameController.text,
          password: passController.text,
          phone: phoneController.text);
      if (success == null) {
        ModalFeedBack.show(
            context: context,
            text:
                'Não foi possível criar seu usuário. Por favor tente novamente mais tarde!',
            isSuccess: false);
      } else {
        if (!success['success'].success) {
          ModalFeedBack.show(
              context: context,
              text: success['success'].message,
              isSuccess: false);
          isLoading.value = false;
          return;
        }
        Get.offAllNamed(ROUTE_RGISTER_CODE, arguments: {
          'email': emailController.text,
          'routeOnSubmitted': ROUTE_LOGIN
        });
      }
      isLoading.value = false;
    }
  }
}
