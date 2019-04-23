import 'package:flutter/material.dart';
import 'package:fuel/bloc/cityBloc.dart';
import 'package:fuel/model/cityModel.dart';

class CitySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City"),
      ),
      body: Column(
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(left: 5, right: 5),
            //   child: TextField(
            //     controller:
            //         TextEditingController(text: stateBloc.searchTextData ?? ""),
            //     autofocus: true,
            //     autocorrect: false,
            //     decoration: InputDecoration(
            //       hintText: "Search State",
            //       prefixIcon: Icon(Icons.search),
            //     ),
            //     onChanged: (data) {
            //       stateBloc.searchInState(data);
            //     },
            //   ),
            // ),
            Expanded(
              child: StreamBuilder(
                stream: cityBloc.getSelectedPrice(),
                builder: (context, AsyncSnapshot<List<CityModel>> snapShot) {
                  if (snapShot.hasData) {
                    if (snapShot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapShot.data.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            onChanged: (val){},
                            value: false,
                            title: Text(snapShot.data[index].townName),
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
        ),
    );
  }
}
