import 'dart:developer';

import 'package:api_practice_getx/network/service/service.dart';
import 'package:dio/dio.dart';

import '../../constants/api_urls.dart';

class PostApi {
  final ApiService _apiService = ApiService();

  Future<Response> getUsers() async {
    try {
      final Response response = await _apiService.get(AppUrl.posts);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getPosts() async {
    try {
      final Response response = await _apiService.get(AppUrl.posts);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postUser({Map<String, dynamic>? data}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.posts,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putUser(String id, {Map<String, dynamic>? data}) async {
    try {
      final Response response = await _apiService.put(
        '${AppUrl.posts}/$id',
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteUser(String id) async {
    try {
      final Response response = await _apiService.delete(
        '${AppUrl.posts}/$id',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
