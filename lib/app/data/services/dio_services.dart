import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/model/news_model_model.dart';

class DioService {
// return response.body;

  Future<NewsModel?> getAllNews(String endPoint) async {
    final response = await Dio().get(endPoint);
    if (response.statusCode == 200) {
      var data = newsModelFromJson(json.encode(response.data).toString());
      return data;
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
              'Getting fetching the news from server ${response.statusMessage}')));
      return null;
    }
  }

  Future<NewsModel?> getAllTopNews(String endPoint) async {
    final response = await Dio().get(endPoint);
    if (response.statusCode == 200) {
      var data = newsModelFromJson(json.encode(response.data).toString());
      return data;
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
              'Getting fetching the news from server ${response.statusMessage}')));
      return null;
    }
  }
}
