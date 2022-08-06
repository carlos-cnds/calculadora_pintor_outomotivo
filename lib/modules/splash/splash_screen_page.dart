import 'package:calculadora_pintor_automotivo/modules/splash/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Image.asset(
            'assets/images/pintor_automotivo_logo_mini.png',
          ),
        ),
      ),
    );
  }
}
