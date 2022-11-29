import 'package:api_practice_getx/internet/network_controller.dart';
import 'package:get/get.dart';

class InternetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
    );
  }
}
