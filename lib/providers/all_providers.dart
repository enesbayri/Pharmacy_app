

import 'package:flutter_application_23/data/dataset.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedProvider = StateProvider<int>((ref) {
  int select = DataSet.indexOfCity(ref.read(pharmCityProvider.notifier).state);
  return select;
});

final pharmCityProvider = StateProvider<String>((ref) {
  return "adana";
});


