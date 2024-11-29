import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/utils/app_colors.dart';
import 'package:machine_test/utils/kstyles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/global_constants.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          return
              // controller.isLoading.value
              //   ?
              // Column(
              //         children: [
              //           Shimmer.fromColors(
              //             baseColor: Colors.grey[300]!,
              //             highlightColor: Colors.grey[100]!,
              //             child: Container(
              //               width: Constants.width,
              //               height: Constants.height * 0.25,
              //               decoration: BoxDecoration(
              //                 color: Colors.grey[300],
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 20),
              //           ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: 3,
              //             physics: NeverScrollableScrollPhysics(),
              //             itemBuilder: (context, index) {
              //               return Column(
              //                 children: [
              //                   Shimmer.fromColors(
              //                     baseColor: Colors.grey[300]!,
              //                     highlightColor: Colors.grey[100]!,
              //                     child: Container(
              //                       margin: EdgeInsets.only(bottom: 20),
              //                       height: Constants.height * 0.22,
              //                       decoration: BoxDecoration(
              //                         color: Colors.grey[300],
              //                         borderRadius: BorderRadius.circular(20),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               );
              //             },
              //           ),
              //         ],
              //       ):

              Column(
            children: [
              _bannerCarousel(),
              FadeInLeft(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.homePageData["meal_categories"].length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final isExpanded = controller.expandedIndex.value == index;
                    return Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: isExpanded
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(bottom: 20),
                              height: Constants.height * 0.22,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: Constants.height * 0.22,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: Constants.width,
                                              height: Constants.height * 0.2,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    controller.homePageData[
                                                            "meal_categories"]
                                                        [index]["image"],
                                                  ),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.black
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    height: 40,
                                                    width: Constants.width,
                                                    child: Kstyles().semiBold(
                                                        text: controller
                                                                    .homePageData[
                                                                "meal_categories"]
                                                            [index]["name"],
                                                        size: 12,
                                                        color: AppColors
                                                            .backgroundColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .toggleExpand(index);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        spreadRadius: 2,
                                                        blurRadius: 10,
                                                        offset: Offset(0, 0),
                                                      ),
                                                    ],
                                                    shape: BoxShape.circle,
                                                    color: AppColors
                                                        .backgroundColor,
                                                  ),
                                                  child: Icon(
                                                    isExpanded
                                                        ? Icons
                                                            .keyboard_arrow_up
                                                        : Icons
                                                            .keyboard_arrow_down,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (isExpanded)
                              Stack(
                                children: [
                                  FadeInDown(
                                    animate: true,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: Constants.width,
                                          decoration: BoxDecoration(
                                            color: AppColors.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                              controller
                                                  .homePageData[
                                                      "meal_categories"][index]
                                                      ["meal_plans"]
                                                  .length,
                                              (mealIndex) => Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: ListTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  leading: Icon(
                                                    Icons.no_meals_outlined,
                                                    color: AppColors.red,
                                                  ),
                                                  title: Text(
                                                    controller.homePageData[
                                                                "meal_categories"]
                                                            [
                                                            index]["meal_plans"]
                                                        [mealIndex]["name"],
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  subtitle: Kstyles().reg(
                                                    text: controller.homePageData[
                                                                        "meal_categories"]
                                                                    [index]
                                                                ["meal_plans"]
                                                            [mealIndex]
                                                        ["short_description"],
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  SizedBox _bannerCarousel() {
    return SizedBox(
      width: Constants.width,
      height: Constants.height * 0.25,
      child: Column(
        children: [
          CarouselSlider.builder(
              carouselController: controller.carouselController,
              itemCount: controller.bannerList.length,
              options: CarouselOptions(
                height: Constants.height * 0.22,
                viewportFraction: 1,
                enlargeCenterPage: true,
                padEnds: false,
                enlargeFactor: 0.5,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.decelerate,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  controller.updateCarouselIndex(index);
                },
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
              itemBuilder: (context, index, realIndex) {
                log(controller.bannerList[index]["image"]);
                return SizedBox(
                  width: Constants.width,
                  height: Constants.height * 0.21,
                  child: CachedNetworkImage(
                    imageUrl: controller.bannerList[index]["image"] ?? "",
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              }),
          Obx(() {
            return Center(
                child: SmoothPageIndicator(
              controller: PageController(
                initialPage: controller.carouselIndex.value,
              ),
              count: controller.bannerList.length,
              effect: ExpandingDotsEffect(
                dotColor: AppColors.primary.withOpacity(0.5),
                activeDotColor: AppColors.primary,
                dotHeight: 6,
                dotWidth: 6,
                strokeWidth: 1.5,
                spacing: 6,
              ),
              onDotClicked: (index) {
                controller.carouselController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ));
          }),
        ],
      ),
    );
  }
}
