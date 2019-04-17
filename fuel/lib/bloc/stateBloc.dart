import 'package:fuel/api/StateApi.dart';
import 'package:fuel/model/stateModel.dart';
import 'package:rxdart/rxdart.dart';

class StateBloc {
  final state = BehaviorSubject<List<StateModel>>();
  List<StateModel> _state;
  Observable<List<StateModel>> getAllAvailableState() {
    _getAllAvailableState();
    return state.stream;
  }

  void _getAllAvailableState() async {
    if (_state == null) {
      _state = await StateApi().getState();
    }
    state.sink.add(_state);
  }

  void dispose() {
    state.close();
  }
}

final stateBloc = StateBloc();
