import 'package:flutter/material.dart';
import 'package:fuel/bloc/stateBloc.dart';
import 'package:fuel/model/stateModel.dart';

class Search extends StatelessWidget {
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
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: stateBloc.getAllAvailableState(),
                builder: (context, AsyncSnapshot<List<StateModel>> snapShot) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                      itemCount: snapShot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapShot.data[index].stateName),
                        );
                      },
                    );
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
