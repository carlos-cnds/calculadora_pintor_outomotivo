import 'dart:io';

import 'package:calculadora_pintor_automotivo/modules/formula/formula_screen.dart';
import 'package:calculadora_pintor_automotivo/modules/home/home_screen.dart';
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
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(width: 1, color: Colors.black26)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xff111c80))))),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/splash', page: () => SplashScreenPage()),
        GetPage(
            name: '/formula',
            page: () => FormulaScreen(
                  brand: Get.arguments['brand'],
                  product: Get.arguments['product'],
                ))
      ],
    );
  }
}
