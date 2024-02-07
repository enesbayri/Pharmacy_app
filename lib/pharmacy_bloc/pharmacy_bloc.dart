
// ignore_for_file: overridden_fields

import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class PharmListState{
  List<PharmacyModel> pharmList;
  PharmListState({required this.pharmList});
}
class GetPharmListState extends PharmListState{
  @override
  List<PharmacyModel> pharmList;
  GetPharmListState({required this.pharmList}):super(pharmList: pharmList);
}

abstract class PharmListEvent{
  String city;
  PharmListEvent({required this.city});
}

class GetPharmListEvent extends PharmListEvent{
  @override
  String city;
  GetPharmListEvent({required this.city}):super(city: city);
}


class PharmListBloc extends Bloc<PharmListEvent,PharmListState>{
  PharmListBloc():super(GetPharmListState(pharmList: [])){
    on<GetPharmListEvent>((event, emit)async{
      emit(GetPharmListState(pharmList: (await ApiService.getPharmacyList(event.city))));
    });
  }

}

