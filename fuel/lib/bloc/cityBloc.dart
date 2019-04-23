import 'package:fuel/api/CityApi.dart';
import 'package:fuel/bloc/stateBloc.dart';
import 'package:fuel/model/cityModel.dart';
import 'package:rxdart/rxdart.dart';

class CityBloc {
  final city = BehaviorSubject<List<CityModel>>();

  Observable<List<CityModel>> getSelectedPrice() {
    _getPriceForSelectedState();
    return city.stream;
  }

  void _getPriceForSelectedState() async {
    var data = List<CityModel>();
    await Future.forEach(stateBloc.stateCode, (i) async {
      var x = await CityApi().GetCityDetail('hp', 'TN');
      data.addAll(x);
    });
    city.sink.add(data);
  }
}

final cityBloc = CityBloc();
