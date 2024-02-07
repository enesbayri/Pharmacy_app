
import 'package:flutter/material.dart';
import 'package:flutter_application_23/tools/color_helper.dart';

class TextStyleHelper {
  static TextStyle appbarTopTextStyle = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: ColorHelper.zwidgetMain);
  static TextStyle appbarBottomTextStyle =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 0.1);
  static TextStyle cardBottomContentTextStyle =
      TextStyle(fontSize: 16, color: ColorHelper.secondColor);
  static TextStyle loadingLabelTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorHelper.zwidgetMain);
  static TextStyle cardTopContentTextStyle = TextStyle(
      color: ColorHelper.secondColor,
      fontWeight: FontWeight.bold,
      fontSize: 18);
  static TextStyle iconTextStyle(textColor) => TextStyle(
        color: textColor,
        fontSize: 80,
        fontWeight: FontWeight.bold,
      );
  static TextStyle cityPickerTextStyle(index, selected) => TextStyle(
      color:
          selected == index ? ColorHelper.zwidgetMain : ColorHelper.zwidgetMid,
      fontWeight: selected == index ? FontWeight.bold : FontWeight.normal);
}
