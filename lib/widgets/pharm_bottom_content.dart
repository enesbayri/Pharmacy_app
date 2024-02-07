
import 'package:flutter/material.dart';
import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/pharmacy_bloc/pharm_model_cubit.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyBottomContent extends StatelessWidget {
  const PharmacyBottomContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmCubit, PharmacyModel?>(
      builder: (context, pharm) {
        return Column(children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: ListTile(
                leading: Icon(Icons.gps_fixed,color: ColorHelper.secondColor,),
                title: Text("${pharm!.distance.toStringAsFixed(2)} KM",style: TextStyleHelper.cardBottomContentTextStyle,),
                ),
            ),
              
              ),
           Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: ColorHelper.secondColor,
                ),
                title: Text(pharm.tel,
                    style: TextStyleHelper.cardBottomContentTextStyle),
              ),
            ),
          ),    
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ListTile(
                leading: Icon(
                  Icons.map_sharp,
                  color: ColorHelper.secondColor,
                ),
                title: Text(pharm.dist,
                    style: TextStyleHelper.cardBottomContentTextStyle),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Center(
              child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: ColorHelper.secondColor,
                ),
                subtitle: Text(pharm.address,
                    style: TextStyleHelper.cardBottomContentTextStyle),
              ),
            ),
          ),
         
          
        ]);
      },
    );
  }
}
