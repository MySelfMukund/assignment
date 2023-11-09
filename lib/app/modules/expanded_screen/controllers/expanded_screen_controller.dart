import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/model/news_model_model.dart';

class ExpandedScreenController extends GetxController {
  final Rx<NewsDataModel> newsDataModel = NewsDataModel().obs;
  final homeController = Get.find<HomeController>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    newsDataModel.value = homeController.selectedNewsItem.value;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
