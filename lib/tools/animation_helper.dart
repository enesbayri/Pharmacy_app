
import 'package:flutter/animation.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationHelper {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;
  AnimationHelper(TickerProvider vsync) {
    controller = AnimationController(vsync: vsync);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: ColorTween(
                begin: ColorHelper.secondColor, end: ColorHelper.zwidgetMain),
            from: Duration.zero,
            to: const Duration(milliseconds: 1500),
            tag: "textColor")
        .addAnimatable(
            animatable: Tween<double>(begin: 0.6, end: 1),
            from: Duration.zero,
            to: const Duration(milliseconds: 1500),
            tag: "colorOpacity")
        .addAnimatable(
            animatable: ColorTween(
                begin: ColorHelper.mainColor, end: ColorHelper.secondColor),
            from: Duration.zero,
            to: const Duration(milliseconds: 1500),
            tag: "bgColor")
        .animate(controller);
  }
  void startAnimation() async {
    controller.forward();
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        await controller.forward();
      }
    });
  }
}
