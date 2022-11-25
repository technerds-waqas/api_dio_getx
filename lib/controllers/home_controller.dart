import 'dart:convert';

import 'package:api_practice_getx/model/post_model.dart';
import 'package:api_practice_getx/network/api/api.dart';
import 'package:api_practice_getx/network/service/api_exceptions.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomePageController extends GetxController
    with StateMixin<List<PostModel>> {
  final PostApi _postApi = PostApi();
  RxList<PostModel> posts = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      final response = await _postApi.getPosts();
      if (response.statusCode == 200) {
        final List jsonRes = response.data;
        if (jsonRes.isNotEmpty) {
          posts.value = jsonRes.map((e) => PostModel.fromJson(e)).toList();

          change(posts, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('no post found'));
        }
      }
    } on DioError catch (e) {
      final ApiException apiException = ApiException.fromDioError(e);
      change(null, status: RxStatus.error(apiException.toString()));
    }
  }
}
