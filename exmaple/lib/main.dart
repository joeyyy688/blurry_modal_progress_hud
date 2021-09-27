import '../screens/homePage.dart';
import '../screens/landingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        LandingPage.routeName: (context) => LandingPage()
      },
    );
  }
}
