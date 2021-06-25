import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color_generator/random_color_generator.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RandomColorGenerator _randomColorGenerator = new RandomColorGenerator();
  // Random color and RGB will be assigned to _backgroundColor in overrode initState().
  late Color _backgroundColor;
  late Color _textColor;
  late String _backgroundColorRGB;

  @override
  void initState() {
    super.initState();
    _backgroundColor = _randomColorGenerator.nextColor();
    // Text color rgb values will be different from backgroundColor
    // so that text will always show on screen.
    _textColor = Color.fromRGBO(_backgroundColor.red - 128,
        _backgroundColor.green - 128, _backgroundColor.green - 128, 1.0);
    _backgroundColorRGB = '#${_backgroundColor.red}.${_backgroundColor.green}.${_backgroundColor.blue}';
  }

  // If user taps the screen - changes color to random Color.
  void _onScreenTap() {
    setState(() {
      _backgroundColor = _randomColorGenerator.nextColor();
      _textColor = Color.fromRGBO(_backgroundColor.red - 128,
          _backgroundColor.green - 128, _backgroundColor.green - 128, 1.0);
      _backgroundColorRGB = '#${_backgroundColor.red}.${_backgroundColor.green}.${_backgroundColor.blue}';
    });
  }

  void _onRGBCodeLongPress() {
    Clipboard.setData(ClipboardData(text: _backgroundColorRGB));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      // We need to use Stack for reacting to tap on whole screen as inner layer
        // and for saving code for clipboard functionality at the bottom right
        // as the outer layer.
      body: Stack(
        children: [
          // GestureDetector to react to tap on whole screen
          GestureDetector(
            // Define translucent behaviour to apply to all children in widget tree
            behavior: HitTestBehavior.translucent,
            onTap: _onScreenTap,
            child: Container(
              child: Center(
                child: Text(
                  'Hey there',
                  style: GoogleFonts.kirangHaerang(
                    fontSize: 56,
                    color: _textColor,
                  ),
                ),
              ),
            ),
          ),
          // This aligns two string clicking by lower one you can
          // save RGB code to the clipboard.
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(20),
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Hold code to copy',
                      style: GoogleFonts.kirangHaerang(
                        fontSize: 24,
                        color: _textColor.withOpacity(0.5),
                      ),
                    ),
                    GestureDetector(
                      onLongPress: _onRGBCodeLongPress,
                      child: Text(
                        _backgroundColorRGB,
                        style: GoogleFonts.kirangHaerang(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          color: _textColor.withOpacity(0.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      )
    );
  }
}

