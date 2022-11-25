import 'dart:developer';

import 'package:api_practice_getx/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('build is calling again=-=-=-=-=-=--=----=');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'HomePage',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: controller.fetchPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error'));
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Obx(
                      () => ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final post = snapshot.data![index];
                          log('this is length -=-=-=-=- ${snapshot.data!.length}');
                          return Column(
                            children: [
                              Card(
                                // height: Get.height * 0.25,
                                // width: Get.width,
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
                    );
                  } else {
                    log('this is snapshot -=-=-= ${snapshot.data}');
                    return const Center(
                      child: Text('Nothing'),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}







/** 
 * 
 * 
 * 
*/