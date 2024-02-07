import 'package:dio/dio.dart';
import 'package:flutter_application_23/models/pharm_model.dart';

class ApiService {
  static String baseUrl = "https://www.nosyapi.com/apiv2/pharmacyLink";
  static String apiKey =
      "Your Api Key";

  static Future<List<PharmacyModel>> getPharmacyList(String city) async {
    var results = await Dio().get("$baseUrl?city=$city&apikey=$apiKey");
    var result = results.data["data"];
    List<PharmacyModel> pharmacies = [];
    if (results.data["status"] == "success") {
      pharmacies = [for (final phar in result) PharmacyModel.fromMap(phar)];
    }
    return pharmacies;
  }
}
