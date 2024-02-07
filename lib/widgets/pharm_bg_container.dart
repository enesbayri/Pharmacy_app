
import 'package:flutter/material.dart';

class PharmacyBGContainer extends StatelessWidget {
  const PharmacyBGContainer(
      {super.key,
      required this.topColor,
      required this.bottomColor,
      this.topChild,
      this.bottomChild});
  final Color topColor;
  final Color bottomColor;
  final Widget? topChild;
  final Widget? bottomChild;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: topColor,
        ),
        child: topChild,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          color: bottomColor,
        ),
        child: bottomChild,
      )
    ]);
  }
}
