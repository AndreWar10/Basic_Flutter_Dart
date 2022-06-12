import 'package:flutter/material.dart';
import 'package:nav_pages/two_page.dart';
import 'views/one_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //esconde debug
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnePage(), //nome da rota
        '/twoPage':(context) => const TwoPage(),
      },
    );
  }
}


