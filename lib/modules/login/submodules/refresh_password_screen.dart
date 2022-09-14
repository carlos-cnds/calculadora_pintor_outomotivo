import 'package:calculadora_pintor_automotivo/modules/login/submodules/refresh_password_controller.dart';
import 'package:calculadora_pintor_automotivo/shared/components/progress_indicator_white.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefreshPasswordScreen extends StatelessWidget {
  final String email;
  const RefreshPasswordScreen({Key? key, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshPasswordController controller = Get.put(RefreshPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Pintor Automotivo"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Criar Nova Senha",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Obx(() {
                  return TextField(
                      obscureText: !controller.passVisible.value,
                      controller: controller.passController,
                      decoration: InputDecoration(
                          label: Text("Senha"),
                          suffixIcon: IconButton(
                            icon: Icon(!controller.passVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              controller.passVisible.value =
                                  !controller.passVisible.value;
                            },
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: ICON_COLOR,
                          )));
                }),
                SizedBox(height: 10),
                Obx(() {
                  return TextField(
                      obscureText: !controller.confirmPassVisible.value,
                      controller: controller.confirmPassController,
                      decoration: InputDecoration(
                          label: Text("Confirmar Senha"),
                          suffixIcon: IconButton(
                            icon: Icon(!controller.confirmPassVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              controller.confirmPassVisible.value =
                                  !controller.confirmPassVisible.value;
                            },
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: ICON_COLOR,
                          )));
                }),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Obx(() {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                        onPressed: () => controller.refreshPassword(
                            context: context, email: email),
                        child: controller.isLoading.value
                            ? ProgressIndicatorWhite()
                            : Text(
                                "Confirmar",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ));
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
