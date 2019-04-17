class StateModel {
  final String stateName;
  final String stateCode;
  StateModel({this.stateName, this.stateCode});
  factory StateModel.fromJson(Map<String, dynamic> jsonDate) {
    return StateModel(stateName: jsonDate["Name"], stateCode: jsonDate["Code"]);
  }
}
