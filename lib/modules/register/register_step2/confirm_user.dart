import 'package:calculadora_pintor_automotivo/modules/register/register_step2/confirm_user_controller.dart';
import 'package:calculadora_pintor_automotivo/modules/register/repositories/register_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/components/modal_feedback.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmUser extends StatelessWidget {
  final String email;
  const ConfirmUser({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConfirmUserController controller = Get.put(ConfirmUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Pintor Automotivo"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Código de acesso",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Digite a sequência numérica de quatro dígitos que enviamos para seu e-mail '$email'",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      onChanged: (t) {
                        if (t.length > 0) {
                          FocusScope.of(context)
                              .requestFocus(controller.focus2);
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.text1,
                      decoration: InputDecoration(counterText: ''),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      focusNode: controller.focus2,
                      onChanged: (t) {
                        if (t.length > 0) {
                          FocusScope.of(context)
                              .requestFocus(controller.focus3);
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.text2,
                      decoration: InputDecoration(counterText: ''),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      focusNode: controller.focus3,
                      onChanged: (t) {
                        if (t.length > 0) {
                          FocusScope.of(context)
                              .requestFocus(controller.focus4);
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.text3,
                      decoration: InputDecoration(counterText: ''),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      focusNode: controller.focus4,
                      onChanged: (t) {
                        if (t.length > 0) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.text4,
                      decoration: InputDecoration(counterText: ''),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("Re-enviar código de acesso"),
                  onPressed: () async {
                    var success =
                        await RegisterRepository.resendCode(email: email);
                    if (success != null) {
                      ModalFeedBack.show(
                          context: context,
                          text: success.message!,
                          isSuccess: success.success!);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                    onPressed: () async {
                      var success = await RegisterRepository.activateUser(
                          email: email,
                          code:
                              '${controller.text1.text}${controller.text2.text}${controller.text3.text}${controller.text4.text}');
                      if (success == null) {
                        await ModalFeedBack.show(
                            context: context,
                            text:
                                'Ocorreu em erro ao tentar ativar seu usuário. Por favor tente novamente',
                            isSuccess: false);
                        return;
                      }
                      if (!success.success!) {
                        await ModalFeedBack.show(
                            context: context,
                            text: success.message!,
                            isSuccess: false);
                        return;
                      }
                      await ModalFeedBack.show(
                          context: context,
                          text:
                              "Tudo certo com seu usuário! Você já pode fazer login",
                          isSuccess: true);
                      Get.offAndToNamed(ROUTE_LOGIN,
                          arguments: {'email': email});
                    },
                    child: Text(
                      "Confirmar",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
        );
      }),
    );
  }
}
