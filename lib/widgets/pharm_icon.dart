
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_23/tools/boxborder_helper.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';

class PharmacyIcon extends StatelessWidget {
  PharmacyIcon({
    super.key,
    required this.bgColor,
    required this.textColor,
  });
  late Color bgColor;
  late Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: BoxBorderHelper.iconBoxBorder),
      child: Stack(
        children: [
          Positioned(
              left: 75 / 2 - 28,
              top: -20,
              child: Text(
                "E",
                style: TextStyleHelper.iconTextStyle(textColor),
              ))
        ],
      ),
    );
  }
}
