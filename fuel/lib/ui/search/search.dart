import 'package:flutter/material.dart';
import 'package:fuel/bloc/stateBloc.dart';
import 'package:fuel/model/stateModel.dart';

class Search extends StatelessWidget {
  final stateBloc = StateBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                autofocus: true,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Search State",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (data) {
                  stateBloc.searchInState(data);
                },
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: stateBloc.getAllAvailableState(),
                builder: (context, AsyncSnapshot<List<StateModel>> snapShot) {
                  if (snapShot.hasData) {
                    if (snapShot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapShot.data.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            onChanged: (bool value) =>
                                stateBloc.selectedStateChkBox(
                                    value, snapShot.data[index].stateId),
                            value: snapShot.data[index].isSelected,
                            title: Text(snapShot.data[index].stateName),
                            controlAffinity: ListTileControlAffinity.trailing,
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Container(
                          child: Text("No Data Found for this Search criteria"),
                        ),
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
