import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorGenerator {
  RandomColorGenerator({int? seed}) :
        _random = Random(seed);

  final Random _random;

  // Returns Color with random r, g, b values(0-255). Opacity set
  // to 1.0 to be fully opaque.
  Color nextColor() {
    return Color.fromRGBO(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
  }
}