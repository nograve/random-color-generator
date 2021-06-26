import 'package:flutter/material.dart';
import 'package:random_color_generator/home_page.dart';

class RandomColorGeneratorApp extends StatelessWidget {
  const RandomColorGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Random Color Generator Application',
      home: HomePage(),
    );
  }
}
