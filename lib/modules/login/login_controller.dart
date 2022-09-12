import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final String email;
  var passVisible = false.obs;
  LoginController({required this.email}) {
    emailController = TextEditingController(text: email);
  }

  TextEditingController emailController = TextEditingController();
}
