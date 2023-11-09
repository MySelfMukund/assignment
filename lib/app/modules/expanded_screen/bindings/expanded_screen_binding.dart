import 'package:get/get.dart';

import '../controllers/expanded_screen_controller.dart';

class ExpandedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpandedScreenController>(
      () => ExpandedScreenController(),
    );
  }
}
