import 'package:calculadora_pintor_automotivo/modules/login/login_controller.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final String email;
  const LoginScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(email: email));
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
            "Login",
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
                    controller: controller.emailController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text("Esqueci a senha"),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text("Cadastrar"),
                      onPressed: () => Get.toNamed(ROUTE_REGISTER),
                    )
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
