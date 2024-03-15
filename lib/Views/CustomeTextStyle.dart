import 'package:flutter/material.dart';
import '../Custome_Functions/Colors/constants.dart';

TextStyle carousel_style(size) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}

TextStyle normal_style() {
  return const TextStyle(color: EventColors.kPrimaryLightColor, fontSize: 15);
}

TextStyle detailview_style() {
  return const TextStyle(color: EventColors.kPrimaryDarkColor, fontSize: 15);
}

TextStyle list_style() {
  return const TextStyle(color: EventColors.kPrimaryDarkColor, fontSize: 15);
}

TextStyle bold_style() {
  return const TextStyle(
      color: EventColors.kPrimaryDarkColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}

TextStyle menubold_style() {
  return const TextStyle(
      color: EventColors.kPrimaryDarkColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}

TextStyle settings() {
  return const TextStyle(
      color: EventColors.kPrimaryDarkColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}

TextStyle settings_normal(Color color) {
  return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.normal);
}
