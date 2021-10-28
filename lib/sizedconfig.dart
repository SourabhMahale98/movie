import 'package:flutter/cupertino.dart';

class Media {
  static double? _screenWidth;
  static double? _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double? image;
  static double? text;
  static double? height;
  static double? width;
  static Orientation orientation = Orientation.portrait;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      orientation = Orientation.portrait;
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
    } else {
      orientation = Orientation.landscape;
      _screenHeight = constraints.maxWidth;
      _screenWidth = constraints.maxHeight;
    }
    _blockHeight = _screenHeight! / 100;
    _blockWidth = _screenWidth! / 100;

    text = _blockHeight;
    image = _blockWidth;
    height = _blockHeight;
    width = _blockWidth;
  }
}
