

import 'package:flutter/material.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              Image.asset("assets/images/loading.gif"),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                    color: ColorHelper.secondColor,
                  ),
                  child: Image.asset(
                    "assets/images/e.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          label,
          style: TextStyleHelper.loadingLabelTextStyle,
        )
      ],
    );
  }
}