import 'package:flutter/material.dart';
import 'package:routeobserver/route/route_utils.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      navigatorObservers: [routeObserver],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Naigation Middleware'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Secound Page'),
              onPressed: () {
                Navigator.pushNamed(context, secondRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    final route = ModalRoute.of(context).settings.name;
    print('didPush route: $route');
  }

  @override
  void didPopNext() {
    final route = ModalRoute.of(context).settings.name;
    print('didPopNext route: $route');
  }

  @override
  void didPushNext() {
    final route = ModalRoute.of(context).settings.name;
    print('didPushNext route: $route');
  }

  @override
  void didPop() {
    final route = ModalRoute.of(context).settings.name;
    print('didPop route: $route');
  }
}
