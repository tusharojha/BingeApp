import 'package:flutter/material.dart';

import './screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binge: A Bingo Game!',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
