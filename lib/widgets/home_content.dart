
import 'package:flutter/material.dart';
import 'package:flutter_application_23/widgets/appbar.dart';
import 'package:flutter_application_23/widgets/city_picker.dart';
import 'package:flutter_application_23/widgets/pharm_list.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Appbar(title: "Nöbetçi"),
        CityPicker(),
        PharmacyList(),
        //LoadingWidget(label: "Nobetçi eczaneler yükleniyor!",)
        //ErrorWidget()
      ],
    );
  }
}
