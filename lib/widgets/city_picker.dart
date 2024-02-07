import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_23/data/dataset.dart';
import 'package:flutter_application_23/providers/all_providers.dart';
import 'package:flutter_application_23/tools/char_helper.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityPicker extends ConsumerStatefulWidget {
  const CityPicker({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CityPickerState();
}

class _CityPickerState extends ConsumerState<CityPicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selected = ref.watch(selectedProvider);
    String city = ref.watch(pharmCityProvider);
    String selectedCity = TextToEnglishChar.from(DataSet.cityList[selected]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        picker(context, selected),
        selectedCity != city
            ? Flexible(
                child: OutlinedButton.icon(
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll(BorderSide(
                            color: ColorHelper.zwidgetMain, width: 2))),
                    label: Text(
                      "Listele",
                      style: TextStyleHelper.loadingLabelTextStyle,
                    ),
                    onPressed: () {
                      ref.read(pharmCityProvider.notifier).state = selectedCity;
                    },
                    icon: Icon(Icons.check, color: ColorHelper.zwidgetMain)))
            : Container(),
      ],
    );
  }

  SizedBox picker(BuildContext context, int selected) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: RotatedBox(
        quarterTurns: 3,
        child: CupertinoPicker(
            itemExtent: 150,
            useMagnifier: true,
            looping: true,
            scrollController:
                FixedExtentScrollController(initialItem: selected),
            onSelectedItemChanged: (value) {
              ref.read(selectedProvider.notifier).state = value;
            },
            //backgroundColor: ColorHelper.zwidgetMain,
            magnification: 1.3,
            children: DataSet.cityList.map((e) {
              int index = DataSet.cityList.indexOf(e);
              return RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                      child: Text(
                    e,
                    style: TextStyleHelper.cityPickerTextStyle(index, selected),
                  )));
            }).toList()),
      ),
    );
  }
}
