import 'package:calculadora_pintor_automotivo/models/success.dart';
import 'package:calculadora_pintor_automotivo/modules/profile/repositories/profile_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/components/modal_feedback.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/brand_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/favorires_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/formula_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/user_local_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/version_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileController extends GetxController {
  var user = UserLocalRepository.getUser();
  var loadingSave = false.obs;
  var loadingDelete = false.obs;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();

  final BuildContext context;
  ProfileController({required this.context}) {
    nameTextController = TextEditingController(text: user!.name!);
    emailTextController = TextEditingController(text: user!.email!);
    phoneTextController = TextEditingController(text: user!.phoneNumber!);
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool validateFields() {
    if (nameTextController.text.isEmpty) {
      ModalFeedBack.show(
          context: context, text: 'Informe seu nome', isSuccess: false);
      return false;
    } else if (nameTextController.text.length <= 3) {
      ModalFeedBack.show(
          context: context, text: 'Nome muito pequeno', isSuccess: false);
      return false;
    } else if (phoneTextController.text.isEmpty) {
      ModalFeedBack.show(
          context: context, text: 'Informe seu telefone', isSuccess: false);
      return false;
    } else {
      return true;
    }
  }

  sendForm() async {
    if (validateFields()) {
      if (loadingSave.value) {
        return;
      }
      loadingSave.value = true;
      var success = await ProfileRepository.updateUser(
          name: nameTextController.text,
          id: user!.id!,
          phone: phoneTextController.text);

      if (success == null) {
        Fluttertoast.showToast(
            msg: "Erro ao atualizar. Por favor, tente novamente",
            backgroundColor: Colors.redAccent);
      } else {
        Fluttertoast.showToast(msg: success.message!);
        if (success.success!) {
          user!.name = nameTextController.text;
          user!.phoneNumber = phoneTextController.text;
          UserLocalRepository.setUser(user: user!);
        }
      }
      loadingSave.value = false;
    }
  }

  deleteData() async {
    if (loadingDelete.value) {
      return;
    }
    loadingDelete.value = true;
    var success = await ProfileRepository.delete(id: user!.id!);

    if (success == null) {
      Fluttertoast.showToast(
          msg: "Erro ao deletar. Por favor, tente novamente",
          backgroundColor: Colors.redAccent);
    } else {
      Fluttertoast.showToast(msg: success.message!);
      if (success.success!) {
        UserLocalRepository.clearUser();
        BrandRepository.clearLocal();
        FormulaRepository.clearLocal();
        FavoriteRepository.clearFavorites();
        VersionRepository.updateLocal(version: "");
        Get.offAllNamed(ROUTE_SPLASH);
      }
    }
    loadingDelete.value = false;
  }
}
