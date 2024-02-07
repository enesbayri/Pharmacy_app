
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_23/tools/animation_helper.dart';
import 'package:flutter_application_23/tools/boxborder_helper.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/widgets/pharm_icon.dart';
import 'package:zwidget/zwidget.dart';

class PharmacyIconContainer extends StatefulWidget {
  const PharmacyIconContainer({
    super.key,
  });

  @override
  State<PharmacyIconContainer> createState() => _PharmacyIconContainerState();
}


class _PharmacyIconContainerState extends State<PharmacyIconContainer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animation = AnimationHelper(this);
    animation.startAnimation();
  }

  late AnimationHelper animation;
  @override
  void dispose() {
    animation.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => ZWidget.forwards(
        midChild: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              color:
                  animation.sequenceAnimation["bgColor"].value.withOpacity(1.0),
              borderRadius: BorderRadius.circular(16),
              border: BoxBorderHelper.iconBoxBorder),
        ),
        midToTopChild: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              color: ColorHelper.zwidgetMid.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: BoxBorderHelper.iconBoxBorder),
        ),
        topChild: PharmacyIcon(
            bgColor: (animation.sequenceAnimation["bgColor"].value)
                .withOpacity(animation.sequenceAnimation["colorOpacity"].value),
            textColor: animation.sequenceAnimation["textColor"].value),
        rotationX: -pi / 18,
        rotationY: pi / 18,
        layers: 11,
        depth: 16,
      ),
    );
  }
}
