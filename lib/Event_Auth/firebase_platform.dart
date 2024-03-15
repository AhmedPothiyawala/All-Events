import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> stable_firebase() async {
  try {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.ios,
      );
    } else if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.android,
      );
    }
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {}
}
