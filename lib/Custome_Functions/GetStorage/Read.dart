import 'package:get_storage/get_storage.dart';

Future<Map<String, String>> getUserData() async {
  final storage = GetStorage();
  final email = await storage.read('email');
  final photoUrl = await storage.read('photoUrl');
  final name = await storage.read('name');

  return {'email': email, 'photoUrl': photoUrl, 'name': name};
}
