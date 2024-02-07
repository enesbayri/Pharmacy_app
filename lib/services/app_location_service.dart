
import 'package:flutter/material.dart';
import 'package:flutter_application_23/providers/all_providers.dart';
import 'package:flutter_application_23/tools/char_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

class AppLocationService {
  static double appLatitude=0;
  static double appLongitude=0;
  
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<int> getAppLocation(WidgetRef ref) async {
    String city = "";
    try {
      Position position = await determinePosition();
      double latitude = position.latitude;
      double longitude = position.longitude;
      appLatitude=latitude;
      appLongitude=longitude;
      var address = await GeoCode()
          .reverseGeocoding(latitude: latitude, longitude: longitude);
      city = address.city!;
      if(city.contains("/")){
        List citySplit=city.split("/");
        city=citySplit[1];
      }
      if(city=="pricing"){
        city="adana";
      }
    } catch (e) {
      city = "adana";
    }
    ref.read(pharmCityProvider.notifier).state = TextToEnglishChar.from(city);
    debugPrint("buraaaa $city");
    return 1;
  }
}
