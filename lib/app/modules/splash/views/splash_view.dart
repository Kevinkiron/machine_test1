import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/kstyles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Kstyles().bold(
                  text: "Machine Test",
                  size: 17,
                  color: AppColors.backgroundColor)),
        ],
      ),
    );
  }
}
