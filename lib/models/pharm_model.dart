import 'package:flutter_application_23/services/app_location_service.dart';
import 'package:flutter_application_23/services/distance_calc_service.dart';

class PharmacyModel {
  String name;
  String tel;
  String dist;
  String address;
  double latitude;
  double longitude;
  double distance;
  PharmacyModel({
    required this.name,
    required this.tel,
    required this.dist,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.distance
  });



  factory PharmacyModel.fromMap(Map<String, dynamic> map) {
    return PharmacyModel(
      name: map['EczaneAdi'] as String,
      tel: map['Telefon'] as String,
      dist: map['ilce'] as String,
      address: map['Adresi'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      distance: DistCalc.calculateDistance(map['latitude'],map['longitude'], AppLocationService.appLatitude, AppLocationService.appLongitude)
    );
  }

  @override
  String toString() {
    return 'PharmacyModel(name: $name, tel: $tel, dist: $dist, address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant PharmacyModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.tel == tel &&
        other.dist == dist &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        tel.hashCode ^
        dist.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
