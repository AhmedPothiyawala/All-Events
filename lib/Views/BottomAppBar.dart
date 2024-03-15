import 'package:all_events/Custome_Functions/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../Controller/BottomController.dart';
import '../Controller/ExitController.dart';
import '../Custome_Functions/Custome_Strings/heading.dart';
import 'CustomeWidget.dart';
import 'CategoryView.dart';
import 'Feed.dart';
import 'Setting.dart';

class BottomAppBarView extends GetView<BottomNavigationController> {
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final exitConfirmationController = Get.put(ExitConfirmationController());
  final pages = [CategoryView(), Feed(), Setting()];
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return WillPopScope(
        onWillPop: () => exitConfirmationController.showExitConfirmation(),
        child: Scaffold(
            backgroundColor: EventColors.kPrimaryLightColor,
            body: Obx(() => pages[controller.selectedIndex.value]),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                selectedItemColor: EventColors.kPrimary_amount_color,
                unselectedItemColor: EventColors.kPrimaryDarkColor,
                selectedFontSize: 15,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                currentIndex: controller.selectedIndex.value,
                onTap: controller.onTap,
                items: [
                  BottomBarItem(CustomHeading.explore, Icons.explore),
                  BottomBarItem(CustomHeading.feed, Icons.feed),
                  BottomBarItem(CustomHeading.settings, Icons.settings),
                ],
              ),
            )));
  }
}
