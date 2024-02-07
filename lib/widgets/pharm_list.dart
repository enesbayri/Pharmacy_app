
import 'package:flutter/material.dart';
import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/pharmacy_bloc/pharm_model_cubit.dart';
import 'package:flutter_application_23/providers/all_providers.dart';
import 'package:flutter_application_23/services/api_service.dart';
import 'package:flutter_application_23/tools/char_helper.dart';
import 'package:flutter_application_23/widgets/error_widget.dart';
import 'package:flutter_application_23/widgets/loading_widget.dart';
import 'package:flutter_application_23/widgets/pharm_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PharmacyList extends ConsumerWidget {
  const PharmacyList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String city = ref.watch(pharmCityProvider);
    city = TextToEnglishChar.from(city);
    return FutureBuilder(
      key: UniqueKey(),
      future: ApiService.getPharmacyList(city),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PharmacyModel> pharmList = snapshot.data!;
          pharmList.sort((a, b) => a.distance.compareTo(b.distance));
          return Flexible(
              child: ListView(
            children: pharmList.map((e) => BlocProvider(
                      create: (_) => PharmCubit(pharm: e),
                      child: const PharmacyCard(),
                    ))
                .toList(),
          ));
        } else if (snapshot.hasError) {
          return  const Errorwidget();
        } else {
          return const Flexible(
              child: Center(
            child: LoadingWidget(label: "Nobetçi eczaneler yükleniyor!"),
          ));
        }
      },
    );
  }
}
