import 'package:flutter/material.dart';

class RandomColorGenerator {
  // Initialize _currentColor with random color
  RandomColorGenerator() :
      // TODO: Implement color randomness
        _currentColor = Colors.white;
  // Initialize _currentColor with given color
  RandomColorGenerator.initColor(Color color) :
        _currentColor = color;

  Color _currentColor;

  String getColorRGB() {
    return '#${_currentColor.red}.${_currentColor.green}.${_currentColor.blue}';
}
}