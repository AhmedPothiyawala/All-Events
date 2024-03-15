import 'dart:io';
import 'package:all_events/Views/BottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Custome_Functions/Custome_Strings/heading.dart';
import 'Custome_Functions/GetStorage/Read.dart';
import 'Custome_Functions/Http_Override/MyHttpOverrides.dart';
import 'Custome_Functions/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_all_screen.dart';
import 'package:get/get.dart';
import 'Custome_Functions/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_splashcreen.dart';
import 'Custome_Functions/Themes/themes.dart';
import 'Event_Auth/firebase_platform.dart';
import 'package:get_storage/get_storage.dart';
import 'Views/Login_Screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  System_Orientation_and_SystemUIOverlayStyle_splashcreen();
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
  Map<String, String> data = await getUserData();
  stable_firebase();
  runApp(MyApp(data['email']));
}

class MyApp extends StatelessWidget {
  final email;
  MyApp(this.email);
  @override
  Widget build(BuildContext context) {
    System_Orientation_and_SystemUIOverlayStyle_all_screen();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: CustomHeading.application_name,
      theme: EventThemes.lightTheme,
      darkTheme: EventThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: email == null ? LoginScreen() : BottomAppBarView(),
    );
  }
}
