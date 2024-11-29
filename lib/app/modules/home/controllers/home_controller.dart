import 'dart:developer';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/app/modules/home/views/more.dart';
import '../../../data/api_constants.dart';
import '../../../data/api_service.dart';
import '../views/home_screen.dart';
import '../views/meals.dart';
import '../views/profile.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  final CarouselSliderController carouselController =
      CarouselSliderController();
  var isLoading = false.obs;
  RxMap homePageMap = {}.obs;
  RxMap homePageData = {}.obs;
  RxList bannerList = [].obs;

  void bottomIndex(int index) {
    currentIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    const Meals(),
    const Profile(),
    const MoreScreen(),
  ];

  DateTime? lastPressed;

  Future<bool> onWillPop() async {
    final now = DateTime.now();

    if (lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 2)) {
      lastPressed = now;

      Get.snackbar(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        'Exit App',
        'Press back again to exit',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black45,
        colorText: Colors.white,
      );

      return false;
    }
    return true;
  }

  void updateCarouselIndex(int index) {
    carouselIndex.value = index;
  }

  RxInt carouselIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    try {
      isLoading.value = true;

      final response = await ApiService().callApi(
        endpoint: ApiConstants.getCategories,
        method: 'POST',
      );

      if (response!.data != null && response.statusCode == 200) {
        homePageMap.value = response.data;
        homePageData.value = homePageMap["data"];
        bannerList.value = homePageData["banners"];
        log(homePageData.toString());
        isLoading.value = false;
      } else {
        log('Error: ${response.statusCode} - ${response.data}');
        isLoading.value = false;
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  RxInt expandedIndex = (-1).obs;

  void toggleExpand(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }
}
