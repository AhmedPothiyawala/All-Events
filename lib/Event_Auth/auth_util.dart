import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Event_Widgets/feedback_dialog_box.dart';
export 'google_auth.dart';

Future<User> signInOrCreateAccount(
    BuildContext context, Future<UserCredential> Function() signInFunc) async {
  try {
    final UserCredential userCredential = await signInFunc();

    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    await myDialog(
      context: context,
      error: true,
      message: e.message.toString(),
    );
    return null;
  }
}
