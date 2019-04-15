import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  style: TextStyle(color: Colors.white,fontSize: 20),
                )
              ],
            ),
          ),
        ));
  }
}
