import 'package:flutter/material.dart';
import 'package:random_color_generator/random_color_generator.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final RandomColorGenerator _randomColorGenerator = new RandomColorGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _randomColorGenerator.nextColor(),
      body: const Center(
        child: Text('Hey there'),
      ),
    );
  }
}
