import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Loading(),
      routes: {
               "/home": (context) => const Home(),
        "/loading": (context) => const Loading(),
      },
    );
  }
}



