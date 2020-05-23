import 'package:flutter/material.dart';
import 'package:routeobserver/route/route_utils.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
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
              child: Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, secondRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
