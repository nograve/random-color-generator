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
  final RandomColorGenerator _randomColorGenerator = RandomColorGenerator();
  // Random color and RGB will be assigned to _backgroundColor in overrode initState().
  late Color _backgroundColor;
  late Color _textColor;
  late String _backgroundColorRGB;

  @override
  void initState() {
    super.initState();
    _backgroundColor = _randomColorGenerator.nextColor();
    _textColor = _getDifferentColor(_backgroundColor);
    _backgroundColorRGB = _getRGBFromColor(_backgroundColor);
  }

  // The Color rgb values will be different from the given color.
  Color _getDifferentColor(Color color) {
    return Color.fromRGBO(color.red - 128, color.green - 128, color.blue - 128, 1.0);
  }

  // Gets RGB from Color with toRadixString and ensures it's at least
  // 2 digits with padLeft.
  String _getRGBFromColor(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}';
}

  // If user taps the screen - changes color to random Color.
  void _onScreenTap() {
    setState(() {
      _backgroundColor = _randomColorGenerator.nextColor();
      _textColor = _getDifferentColor(_backgroundColor);
      _backgroundColorRGB = _getRGBFromColor(_backgroundColor);
    });
  }

  // Saves rgb code to the clipboard
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
          // This aligns two string clicking by lower one you can
          // save RGB code to the clipboard.
          GestureDetector(
            onTap: _onScreenTap,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(20),
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
                    // This inner GestureDetector reacts on long press and
                    // saves rgb code of the color to the clipboard.
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
          )
        ],
      )
    );
  }
}

