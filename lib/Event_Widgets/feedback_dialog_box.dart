import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future myDialog({
  @required BuildContext context,
  @required bool error,
  @required String message,
}) async {
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: (error) ? const Text('Alert') : const Text('Success'),
        content: Text(message.toString()),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
