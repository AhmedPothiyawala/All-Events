import 'package:all_events/Custome_Functions/Custome_Strings/heading.dart';
import 'package:all_events/Views/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void clearUserData() async {
  final storage = GetStorage();
  await storage.erase();
  Get.snackbar(CustomHeading.warning, CustomHeading.signout,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.logout,
        size: 30,
      ),
      snackPosition: SnackPosition.TOP);
  Get.off(() => (LoginScreen()));
}
