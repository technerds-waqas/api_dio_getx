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

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _postApi.getPosts();
      if (response.statusCode == 200) {
        final List jsonRes = response.data;
        if (jsonRes.isNotEmpty) {
          posts.value = jsonRes.map((e) => PostModel.fromJson(e)).toList();
          if (posts.isNotEmpty) {
            change(posts, status: RxStatus.success());
            return posts;
          }
          change(null,
              status: RxStatus.error('some issue occuered in the api method'));

          return posts;
        } else {
          change(null, status: RxStatus.error('no post found'));
          return posts;
        }
      }
    } on DioError catch (e) {
      final ApiException apiException = ApiException.fromDioError(e);
      change(null, status: RxStatus.error(apiException.toString()));
    }
    return posts;
  }
}
