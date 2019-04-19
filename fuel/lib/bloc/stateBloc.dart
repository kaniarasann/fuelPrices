import 'package:fuel/api/StateApi.dart';
import 'package:fuel/model/stateModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateBloc {
  final state = BehaviorSubject<List<StateModel>>();
  List<StateModel> _state;
  String _searchTextData;
  Observable<List<StateModel>> getAllAvailableState() {
    _getAllAvailableState();
    return state.stream;
  }

  SharedPreferences prefs;
  void _getAllAvailableState() async {
    if (_state == null) {
      _state = await StateApi().getState();
    }
    await _getPersistedValue();
    _searchText();
  }

  Future _getPersistedValue() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    var persistedData = await prefs.getStringList("fuel_state");
    persistedData.forEach((prs) => {
          _state.forEach((f) {
            if (f.stateCode == prs) {
              f.isSelected = true;
            }
          })
        });
  }

  void _searchText() {
    var text = _searchTextData ?? "";
    if (text.length > 0) {
      var data = _state
          .where((i) => i.stateName.toLowerCase().contains(text))
          .toList();
      if (data.length > 0) {
        state.sink.add(data);
      } else {
        state.sink.add(List<StateModel>());
      }
    } else {
      state.sink.add(_state);
    }
  }

  void searchInState(String text) {
    _searchTextData = text.toLowerCase();
    _searchText();
  }

  Future selectedStateChkBox(val, id) async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    List<String> stateCode = List<String>();

    _state.forEach((i) {
      if (i.stateId == id) {
        i.isSelected = val;
        if (val) {
          stateCode.add(i.stateCode);
        }
      }
    });
    await prefs.setStringList('fuel_state', stateCode);
    _searchText();
  }

  void dispose() {
    state.close();
  }
}
