import 'package:api_practice_getx/internet/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetPage extends GetView<NetworkController> {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              color: Colors.white70,
            ),
            const Text(
              'You have lost Internet',
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => controller.onInit(),
              splashColor: Colors.blueGrey,
              child: const Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
