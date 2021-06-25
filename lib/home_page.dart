import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color_generator/random_color_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RandomColorGenerator _randomColorGenerator = new RandomColorGenerator();
  // Random color will be assigned to _backgroundColor in overrode initState().
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = _randomColorGenerator.nextColor();
  }

  // If user taps the screen - changes color to random Color.
  void _onScreenTap() {
    setState(() {
      _backgroundColor = _randomColorGenerator.nextColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: GestureDetector(
        // define translucent behaviour to apply to all children in widget tree
        behavior: HitTestBehavior.translucent,
        onTap: _onScreenTap,
        child: Container(
          child: Center(
            child: Text(
              'Hey there',
              style: GoogleFonts.kirangHaerang(
                fontSize: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

