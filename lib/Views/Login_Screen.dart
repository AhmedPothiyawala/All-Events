import 'package:all_events/Custome_Functions/Colors/constants.dart';
import 'package:all_events/Custome_Functions/Custome_Strings/heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Controller/ExitController.dart';
import '../Custome_Functions/GetStorage/Write.dart';
import '../Event_Auth/google_auth.dart';
import 'BottomAppBar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);
  final exitConfirmationController = Get.put(ExitConfirmationController());
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => exitConfirmationController.showExitConfirmation(),
      child: Scaffold(
        backgroundColor: EventColors.kborderColor,
        body: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(75.0),
                ),
                clipBehavior: Clip.hardEdge,
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          EventColors.top_gradient,
                          EventColors.bottom_gradient
                        ])),
                    height: size.height * 0.60,
                    width: size.width,
                    child: Center(
                        child: Center(
                            child: SvgPicture.asset(
                      'assets/images/Login.svg',
                      height: size.height * 0.5,
                    ))))),
            SizedBox(
              height: 70,
            ),
            SizedBox(
                height: 55,
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    User gUser = await signInWithGoogle(context);
                    if (gUser == null) {
                      return;
                    } else {
                      saveUserData(
                          gUser.email, gUser.photoURL, gUser.displayName);
                      Get.snackbar('Success', 'Login with ${gUser.displayName}',
                          backgroundColor: Colors.green,
                          icon: Icon(
                            Icons.check_circle_rounded,
                            size: 30,
                          ),
                          snackPosition: SnackPosition.TOP);
                      Get.off(() => (BottomAppBarView()));
                    }
                  },
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    height: 35,
                  ),
                  label: const Text(
                    '  ${CustomHeading.google_sign}',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
