import 'package:routeobserver/screen/first_page.dart';
import 'package:routeobserver/screen/second_page.dart';
import 'package:routeobserver/screen/third_page.dart';

import '../main.dart';

final appRoutes = {
  homeRoute: (_) => HomePage(),
  firstRoute: (_) => FirstPage(),
  secondRoute: (_) => SecondPage(),
  thirdRoute: (_) => ThirdPage(),
};

const String homeRoute = "/";
const String firstRoute = "/firstPage";
const String secondRoute = "/secondPage";
const String thirdRoute = "/thirdPage";
