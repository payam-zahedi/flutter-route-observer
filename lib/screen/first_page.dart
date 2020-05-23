import 'package:flutter/material.dart';
import 'package:routeobserver/route/route_utils.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
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
              child: Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, secondRoute);
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
