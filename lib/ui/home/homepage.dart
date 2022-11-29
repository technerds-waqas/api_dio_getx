import 'dart:developer';
import 'package:api_practice_getx/internet/network_controller.dart';
import 'package:api_practice_getx/internet/no_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('build is calling again=-=-=-=-=-=--=----=');
    return GetBuilder<NetworkController>(
      builder: (netWorkController) => netWorkController.connectionType == 0
          ? const NoInternetPage()
          : Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'HomePage',
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: controller.obx(
                      (state) => ListView.builder(
                        itemCount: state!.length,
                        itemBuilder: (context, index) {
                          final post = state[index];
                          log('this is length -=-=-=-=- ${state.length}');
                          return Column(
                            children: [
                              Card(
                                margin: const EdgeInsets.all(2),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        post.id.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        post.userId.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        post.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        post.body.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                                width: Get.width,
                              ),
                            ],
                          );
                        },
                      ),
                      onEmpty: const Center(
                        child: Text(
                          'There is no data',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onLoading: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onError: (error) => Center(
                        child: Text(
                          error.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // FutureBuilder(
                    //   future: controller.fetchPosts(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState == ConnectionState.waiting) {
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     } else if (snapshot.hasError) {
                    //       return const Center(child: Text('Error'));
                    //     } else if (snapshot.connectionState == ConnectionState.done &&
                    //         snapshot.hasData) {
                    //       return
                    //     } else {
                    //       log('this is snapshot -=-=-= ${snapshot.data}');
                    //       return const Center(
                    //         child: Text('Nothing'),
                    //       );
                    //     }
                    //   },
                    // ),
                  ),
                ],
              ),
            ),
    );
  }
}

/** 
 * 
 * 
 * 
*/
