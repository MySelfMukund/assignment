import 'package:assignment_task/app/modules/global_widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';

import '../../global_widgets/loading_widget.dart';
import '../controllers/expanded_screen_controller.dart';

class ExpandedScreenView extends GetView<ExpandedScreenController> {
  const ExpandedScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.newsDataModel.value.title == null
          ? const LoadingWidget()
          : Center(
              child: PinchZoomReleaseUnzoomWidget(
                  child: ImageWidget(
                      width: MediaQuery.sizeOf(context).width,
                      height: 250,
                      data: controller.newsDataModel.value)),
            ),
    ));
  }
}
