import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:fuel/ui/drawer/drawerHeader.dart';

void main() => runApp(MaterialApp(
      title: 'Fuel Price',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {'/': (context) => Dashboard()},
    ));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              "Fuel Prices",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              formatDate(DateTime.now(), [M, ' ', d, ', ', yyyy]),
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w200)
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            HeaderVersion()
          ],
        ),
      ),
    );
  }
}
