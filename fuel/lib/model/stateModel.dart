import 'package:uuid/uuid.dart';

class StateModel {
  final String stateName;
  final String stateCode;
  bool isSelected = false;
  final String stateId;
  StateModel({this.stateName, this.stateCode, this.stateId});
  factory StateModel.fromJson(Map<String, dynamic> jsonDate) {
    return StateModel(
        stateName: jsonDate["Name"],
        stateCode: jsonDate["Code"],
        stateId: Uuid().v4());
  }
}
