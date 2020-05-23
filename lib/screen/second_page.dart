import 'package:flutter/material.dart';
import 'package:routeobserver/route/route_utils.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Home Page'),
              onPressed: () {
                Navigator.pushNamed(context, homeRoute);
              },
            ),
            SizedBox(height: 32),
            RaisedButton(
              child: Text('First Page'),
              onPressed: () {
                Navigator.pushNamed(context, firstRoute);
              },
            ),
            SizedBox(height: 32),
            RaisedButton(
              child: Text('Third Page'),
              onPressed: () {
                Navigator.pushNamed(context, thirdRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
