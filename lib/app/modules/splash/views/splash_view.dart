import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.HOME);
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/news_icon.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
