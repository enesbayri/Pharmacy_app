
import 'package:flutter/material.dart';
import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pharmacy_bloc/pharm_model_cubit.dart';

class PharmacyTopContent extends StatelessWidget {
  const PharmacyTopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 80,
        ),
        BlocBuilder<PharmCubit, PharmacyModel?>(
          builder: (context, pharm) {
            return Text(
              pharm!.name,
              style: TextStyleHelper.cardTopContentTextStyle,
            );
          },
        )
      ],
    );
  }
}
