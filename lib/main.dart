import 'package:flutter/material.dart';
import 'package:nest_egg/nest_egg_homepage.dart';

void main() {
  runApp(const NestEgg());
}

class NestEgg extends StatelessWidget {
  const NestEgg({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NestEggScaffold(),
    );
  }
}
