import 'package:get/get.dart';

import '../../home/bindings/home_binding.dart';
import '../../home/views/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigate();
    super.onInit();
  }

  Future<void> navigate() async {
    return Future.delayed(Duration(seconds: 3), () {
      Get.offAll(
        () => const HomeView(),
        transition: Transition.downToUp,
        fullscreenDialog: true,
        binding: HomeBinding(),
        duration: const Duration(milliseconds: 1000),
      );
    });
  }
}
