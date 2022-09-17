import 'dart:io';

import 'package:calculadora_pintor_automotivo/modules/formula/formula_screen.dart';
import 'package:calculadora_pintor_automotivo/modules/home/home_screen.dart';
import 'package:calculadora_pintor_automotivo/modules/login/login_screen.dart';
import 'package:calculadora_pintor_automotivo/modules/login/submodules/refresh_password_screen.dart';
import 'package:calculadora_pintor_automotivo/modules/register/register_step1/register_politics.dart';
import 'package:calculadora_pintor_automotivo/modules/register/register_step1/register_screen.dart';
import 'package:calculadora_pintor_automotivo/modules/register/register_step2/confirm_user.dart';
import 'package:calculadora_pintor_automotivo/modules/splash/splash_screen_page.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setar app para não virar a tela
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Seta os boxes do hive
  Directory appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Hive.openBox("favorites");
  await Hive.openBox("user");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calculadora Pintor Automotivo',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: MaterialColor(0xff111c80, colorPrimary),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: FILL_COLOR,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: FILL_COLOR)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xff111c80))))),
      initialRoute: ROUTE_SPLASH,
      getPages: [
        GetPage(name: ROUTE_HOME, page: () => const HomeScreen()),
        GetPage(
            name: ROUTE_REFRESH_PASSWORD,
            page: () => RefreshPasswordScreen(
                  email: Get.arguments['email'],
                )),
        GetPage(
            name: ROUTE_LOGIN,
            page: () => LoginScreen(
                  email: Get.arguments == null ? "" : Get.arguments['email'],
                )),
        GetPage(name: ROUTE_REGISTER, page: () => const RegisterScreen()),
        GetPage(name: ROUTE_POLITICS, page: () => const RegisterPolitics()),
        GetPage(
            name: ROUTE_RGISTER_CODE,
            page: () => ConfirmUser(
                email: Get.arguments['email'],
                routeOnSubmitted: Get.arguments['routeOnSubmitted'])),
        GetPage(name: ROUTE_SPLASH, page: () => SplashScreenPage()),
        GetPage(
            name: ROUTE_FORMULA,
            page: () => FormulaScreen(
                  brand: Get.arguments['brand'],
                  product: Get.arguments['product'],
                ))
      ],
    );
  }
}
