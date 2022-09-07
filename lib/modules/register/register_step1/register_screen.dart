import 'package:calculadora_pintor_automotivo/modules/register/register_step1/register_controller.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
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
            "Cadastro",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text("E-mail"),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: ICON_COLOR,
                        ))),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text("Telefone"),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: ICON_COLOR,
                        ))),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return TextField(
                      obscureText: !controller.passVisible.value,
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
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return TextField(
                      obscureText: !controller.confirmPassVisible.value,
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Checkbox(
                          value: controller.checkPolitics.value,
                          onChanged: (value) {
                            controller.checkPolitics.value = value!;
                          });
                    }),
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.black87, fontFamily: 'Montserrat'),
                          children: [
                            TextSpan(text: "Concordo com a "),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: "política de privacidade",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                            TextSpan(text: " do app"),
                          ]),
                    ))
                  ],
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
                      onPressed: () {},
                      child: Text(
                        "Entrar",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
