import 'package:uuid/uuid.dart';

class CityModel {
  final String townName;
  final double diesel;
  final double petrol;
  final bool isMetro;
  final String stateId;
  CityModel(
      {this.townName, this.stateId, this.diesel, this.petrol, this.isMetro});
  factory CityModel.fromJson(Map<String, dynamic> jsonData) {
    return CityModel(
        townName: jsonData["townname"],
        stateId: Uuid().v4(),
        diesel: double.parse(jsonData["diesel"]),
        petrol: double.parse(jsonData["petrol"]),
        isMetro: jsonData["ismetro"].toString() == "N" ? false : true);
  }
}
