
import 'package:flutter/material.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: ColorHelper.zwidgetMain,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 110,
            color: ColorHelper.secondColor,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ECZANE",
                    style: TextStyleHelper.appbarTopTextStyle,
                  ),
                  Text(
                    title,
                    style: TextStyleHelper.appbarBottomTextStyle,
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
