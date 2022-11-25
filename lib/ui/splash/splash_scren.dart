// ignore_for_file: library_private_types_in_public_api

import 'package:api_practice_getx/bindings/homebinding.dart';
import 'package:api_practice_getx/ui/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        print(' this in func in splash');
      },
    ).then(
      (value) => Get.offAll(
        const HomePage(),
        binding: HomePageBinding(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 10),
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/flutterlogo.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Text(
            'Flutter',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
