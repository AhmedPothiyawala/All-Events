import 'package:all_events/Custome_Functions/Colors/constants.dart';
import 'package:flutter/cupertino.dart';

import 'CustomeTextStyle.dart';

Widget NoRecord() {
  return const Center(
    child: Text(
      'No Record Found',
      style: TextStyle(
          color: EventColors.kPrimaryDarkColor,
          fontSize: 24,
          fontWeight: FontWeight.bold),
    ),
  );
}

BottomNavigationBarItem BottomBarItem(String label, IconData iconData) {
  return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
      backgroundColor: EventColors.kborderColor);
}

Text HeadingText(String label, double size) {
  return Text(label, maxLines: 1, style: carousel_style(size));
}

Text CustomeText(String label, int maxliines, bool listile) {
  return Text(label,
      maxLines: maxliines, style: listile ? list_style() : normal_style());
}

Text BoldText(String label, int maxliines) {
  return Text(label, maxLines: maxliines, style: bold_style());
}

Text MenuText(String label, int maxliines) {
  return Text(label, maxLines: maxliines, style: menubold_style());
}

Text DetailText(String label) {
  return Text(label, style: detailview_style());
}

Text SettingText(String label) {
  return Text(label, style: settings());
}

Text SettingNormal(String label, Color color) {
  return Text(label, style: settings_normal(color));
}
