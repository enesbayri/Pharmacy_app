
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/pharmacy_bloc/pharm_model_cubit.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/widgets/pharm_bg_container.dart';
import 'package:flutter_application_23/widgets/pharm_bottom_content.dart';
import 'package:flutter_application_23/widgets/pharm_icon_container.dart';
import 'package:flutter_application_23/widgets/pharm_top_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zwidget/zwidget.dart';

class PharmacyCard extends StatefulWidget {
  const PharmacyCard({
    super.key,
  });

  @override
  State<PharmacyCard> createState() => _PharmacyCardState();
}

class _PharmacyCardState extends State<PharmacyCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmCubit, PharmacyModel?>(
      builder: (context, pharm) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("PharmacyDetail",arguments: pharm);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10, bottom: 20,top: 5),
            child: Stack(
              children: [
                ZWidget.forwards(
                  midChild: PharmacyBGContainer(
                      bottomColor: ColorHelper.mainColor.withOpacity(0.6),
                      topColor: ColorHelper.pharmacyCardTop.withOpacity(0.6)),
                  midToTopChild: PharmacyBGContainer(
                      bottomColor: ColorHelper.zwidgetMid.withOpacity(0.2),
                      topColor: ColorHelper.zwidgetMid.withOpacity(0.2)),
                  topChild: PharmacyBGContainer(
                    bottomColor: ColorHelper.mainColor.withOpacity(0.6),
                    topColor: ColorHelper.pharmacyCardTop.withOpacity(0.6),
                    topChild: const PharmacyTopContent(),
                    bottomChild: const PharmacyBottomContent(),
                  ),
                  rotationX: -pi / 18,
                  rotationY: pi / 18,
                  layers: 30,
                  depth: 16,
                ),
                const PharmacyIconContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
