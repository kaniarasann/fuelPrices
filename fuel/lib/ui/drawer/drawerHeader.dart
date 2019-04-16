import 'package:flutter/material.dart';

class HeaderVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.local_gas_station,
                  size: MediaQuery.of(context).size.height * .15,
                  color: Colors.white,
                ),
                Text(
                  "Fuel Prices",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Version : 0.0.1",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
              ],
            ),
          ),
        ));
  }
}
