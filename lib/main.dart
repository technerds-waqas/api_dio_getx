import 'package:api_practice_getx/internet/internet_binding.dart';
import 'package:api_practice_getx/ui/splash/splash_scren.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      defaultTransition: Transition.native,
      initialBinding: InternetBinding(),
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const SplashPage(),
    );
  }
}
