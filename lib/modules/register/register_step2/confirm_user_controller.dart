import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConfirmUserController extends GetxController {
  var isLoading = false.obs;

  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();

  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();
}
