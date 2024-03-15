import 'package:all_events/Views/CustomeWidget.dart';
import 'package:flutter/material.dart';
import '../Custome_Functions/Colors/constants.dart';
import '../Custome_Functions/Custome_Strings/heading.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EventColors.kPrimaryLightColor,
        title: const Text(
          CustomHeading.feed,
          style: TextStyle(color: EventColors.kPrimaryDarkColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: EventColors.kborderColor,
      body: NoRecord(),
    );
  }
}
