// ignore_for_file: invalid_use_of_protected_member

import 'package:assignment_task/app/constants/global.dart';
import 'package:assignment_task/app/data/services/dio_services.dart';
import 'package:assignment_task/app/modules/home/model/news_model_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<NewsDataModel> topNewsList = <NewsDataModel>[].obs;
  final RxList<NewsDataModel> allNewsList = <NewsDataModel>[].obs;

  final Rx<NewsModel> topNewsModel = NewsModel().obs;
  final Rx<NewsModel> allNewsModel = NewsModel().obs;

  final Rx<NewsDataModel> selectedNewsItem = NewsDataModel().obs;

  final RxInt topNewsCurrentPage = 1.obs;
  final RxInt allNewsCurrentPage = 1.obs;

  final topNewScrollController = ScrollController();
  final gridViewController = ScrollController();

  final isTopNewsLoading = false.obs;
  final isAllNewsLoading = false.obs;
  final addMoreTopNewsLoading = false.obs;
  final addMoreAllNewsLoading = false.obs;

  //for unit test
  final RxString myName = ''.obs;

  @override
  void onInit() {
    myName.value = "Mukund";
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

//for unit testing
  void changeToMiddleName() => myName.value = "murari";
//for unit testing
  void changeToLastName() => myName.value = "pradhan";

  @override
  Future<void> onReady() async {
    await getAllTopNews(isFirstLoading: true);
    await getAllNews(isFirstLoading: true);
    allNewsCurrentPage.value++;
    await getAllNews(isFirstLoading: false);

    //above two line added to take the data 2 times because it is a free api so it gives only 3 items one time.
    topNewScrollController.addListener(() async {
      if (topNewScrollController.position.atEdge) {
        if (topNewScrollController.position.pixels == 0) {
          //List View left item}
          topNewsCurrentPage.value = 1;
          // topNewsList.value.clear();
          // await getAllTopNews(isFirstLoading: false);
        } else {
          //list view right code:
          if (topNewsModel.value.meta!.found > topNewsCurrentPage.value) {
            topNewsCurrentPage.value++;
            await getAllTopNews(isFirstLoading: false);
          }
        }
        print("top news current page ${topNewsCurrentPage.value.toString()}");
      }
    });
    gridViewController.addListener(() async {
      if (gridViewController.position.pixels ==
          gridViewController.position.maxScrollExtent) {
        if (allNewsModel.value.meta!.found > allNewsCurrentPage.value) {
          allNewsCurrentPage.value++;
          await getAllNews(isFirstLoading: false);
        }
      }
    });
    super.onReady();
  }

  Future<void> getAllTopNews({required bool isFirstLoading}) async {
    if (isFirstLoading) {
      isTopNewsLoading.value = true;
    } else {
      addMoreTopNewsLoading.value = true;
    }

    try {
      String url = "$topNewsEndPoint&page=${topNewsCurrentPage.value}";
      print(url);
      var result = await DioService().getAllTopNews(url);
      if (result != null) {
        if (result.data!.isNotEmpty) {
          topNewsModel.value = result;
          topNewsList.value.addAll(result.data!);
          topNewsList.refresh();
        }
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Unable to get the Top News')));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isTopNewsLoading.value = false;
      addMoreTopNewsLoading.value = false;
    }
  }

  Future<void> getAllNews({required bool isFirstLoading}) async {
    if (isFirstLoading) {
      isAllNewsLoading.value = true;
    } else {
      addMoreAllNewsLoading.value = true;
    }
    try {
      String url = "$allNewsEndPoint&page=${allNewsCurrentPage.value}";
      print(url);
      var result = await DioService().getAllNews(url);
      if (result != null) {
        allNewsModel.value = result;
        allNewsList.value.addAll(result.data!);
        allNewsList.refresh();
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Unable to get the Daily News')));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isAllNewsLoading.value = false;
      addMoreAllNewsLoading.value = false;
    }
  }
}
