import 'package:get_storage/get_storage.dart';

void saveUserData(String email, String photoUrl, String name) async {
  final storage = GetStorage();
  await storage.write('email', email);
  await storage.write('photoUrl', photoUrl);
  await storage.write('name', name);
}
