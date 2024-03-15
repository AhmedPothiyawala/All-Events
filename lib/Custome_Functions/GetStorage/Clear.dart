import 'package:all_events/Views/Login_Screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void clearUserData() async {
  final storage = GetStorage();
  await storage.erase();
  Get.off(() => (LoginScreen()));
}
