import 'dart:async';
import 'dart:convert';
import 'package:fuel/model/cityModel.dart';
import 'package:http/http.dart' as http;

class CityApi {
  Future<List<CityModel>> GetCityDetail(String petrolBunk, String state) async {
    var response = await http.get(
        "https://daily-fuel-prices-india.p.rapidapi.com/api/${petrolBunk}/states/${state}",
        headers: {
          "X-RapidAPI-Host": "daily-fuel-prices-india.p.rapidapi.com",
          "X-RapidAPI-Key": "bf1425cf19msh1973d9222823bd9p13ed76jsnb0f319672784"
        });
    if (response.statusCode == 200) {
      List result = json.decode(response.body);
      return (result.map((i) => CityModel.fromJson(i)).toList());
    } else {
      throw Error();
    }
  }
}
