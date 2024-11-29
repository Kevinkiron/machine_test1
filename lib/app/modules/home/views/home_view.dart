import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:machine_test/utils/kstyles.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/global_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, s) async {
          if (didPop) {
            return;
          }
          final shouldPop = await controller.onWillPop();
          if (shouldPop) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: controller.currentIndex.value == 0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: _appBar(context))
              : null,
          body: controller.pages[controller.currentIndex.value],
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 3,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: AnimatedContainer(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInCirc,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: index == controller.currentIndex.value
                                ? AppColors.primary
                                : AppColors.transparent,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                BottomNavigationBar(
                  enableFeedback: false,
                  elevation: 0,
                  backgroundColor: AppColors.backgroundColor,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primary,
                  selectedLabelStyle: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontFamily: "Inter"),
                  unselectedLabelStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 11,
                      fontFamily: "Inter"),
                  unselectedItemColor: AppColors.black,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      activeIcon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_sharp),
                      activeIcon: Icon(Icons.calendar_month_sharp),
                      label: "Solar AMC",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      activeIcon: Icon(Icons.person),
                      label: "My Bookings",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.more_horiz_outlined),
                      activeIcon: Icon(Icons.more_horiz_outlined),
                      label: "Profile",
                    ),
                  ],
                  currentIndex: controller.currentIndex.value,
                  onTap: (value) async {
                    controller.bottomIndex(value);
                  },
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  showUnselectedLabels: true,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget _iconsImg({required String img}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Image.asset(
      img,
      width: Constants.width * 0.1,
      height: Constants.height * 0.025,
    ),
  );
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: AppColors.backgroundColor,
    backgroundColor: AppColors.primary,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: () {},
          child: Icon(Icons.notifications, color: AppColors.backgroundColor),
        ),
      ),
    ],
    centerTitle: true,
    title: Kstyles()
        .reg(text: "PROTENIUM", size: 16, color: AppColors.backgroundColor),
    leadingWidth: Constants.width * 0.3,
  );
}
